import haxe.macro.Expr;
import dot.Attribute;

function main() {
	var graph = new dot.Graph([]);

	var printer = new haxe.macro.Printer();

	function label(n:String) {
		return [Label(n)];
	}

	function map(e:Expr):dot.Node {
		function mapVar(v:Var) {
			var nV = graph.node(label('var ${v.name}'));
			if (v.expr != null) {
				nV.connect(map(v.expr), label("assign"));
			}
			return nV;
		}

		return switch (e.expr) {
			case EBlock([]):
				graph.node(label("{}"));
			case EBlock(el):
				var n0 = map(el[0]);
				var ncur = n0;
				for (i in 1...el.length) {
					var n = map(el[i]);
					ncur.connect(n, label("next"));
					ncur = n;
				}
				n0;
			case EVars(vars):
				var v0 = mapVar(vars[0]);
				var vcur = v0;
				for (i in 1...vars.length) {
					var v = mapVar(vars[i]);
					vcur.connect(v, label("next"));
					vcur = v;
				}
				vcur;
			case EIf(econd, eif, eelse):
				var self = graph.node(label("if"));
				self.connect(map(econd), label("cond"));
				self.connect(map(eif), label("then"));
				if (eelse != null) {
					self.connect(map(eelse), label("else"));
				}
				self;
			case EBinop(op, e1, e2):
				var self = graph.node(label("binop"));
				self.connect(graph.node(label(printer.printBinop(op))), label("op"));
				self.connect(map(e1), label("lhs"));
				self.connect(map(e2), label("rhs"));
				self;
			case ECall(e, params):
				var self = graph.node(label("call"));
				self.connect(map(e), label("subject"));
				for (i in 0...params.length) {
					self.connect(map(params[i]), label('arg$i'));
				}
				self;
			case _:
				graph.node(label(printer.printExpr(e)));
		}
	}

	map(macro {
		var a = 0, b = 1;
		if (Math.random() > 0.5) {
			a = 1;
			b = 2;
		} else {
			b = 3;
		}
		trace(a);
	});

	sys.io.File.saveContent("ast.dot", graph.getDotCode());
}
