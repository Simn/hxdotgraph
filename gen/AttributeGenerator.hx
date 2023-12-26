import haxe.macro.Context;
import haxe.macro.Expr;
import Markdown;
import sys.io.File;
import sys.FileSystem;
import haxe.io.Path;

using StringTools;

typedef AttributeDoc = {
	var defaults:Array<String>;
	var flags:Array<String>;
	var minimums:Array<String>;
	var title:String;
	var types:Array<String>;
	var usedBy:String;
	var description:String;
}

class AttributeGenerator {
	static function capitalize(s:String) {
		if (s.length > 0) {
			return s.charAt(0).toUpperCase() + s.substr(1);
		} else {
			return "";
		}
	}

	static function makeField(doc:AttributeDoc, p:Position) {
		var swap = false;
		function mapType(s:String) {
			return switch (s) {
				case "addDouble":
					macro :AddDouble;
				case "addPoint":
					macro :AddPoint;
				case "arrowType":
					macro :ArrowType;
				case "bool":
					macro :Bool;
				case "clusterMode":
					macro :ClusterMode;
				case "color":
					macro :Color;
				case "colorList":
					macro :Array<Color>;
				case "dirType":
					macro :DirType;
				case "double":
					macro :Float;
				case "doubleList":
					macro :Array<Float>;
				case "int":
					macro :Int;
				case "layerList":
					macro :Array<String>;
				case "layerRange":
					macro :String;
				case "outputMode":
					macro :OutputMode;
				case "packMode":
					macro :PackMode;
				case "pagedir":
					macro :PageDir;
				case "point":
					macro :Point;
				case "pointList":
					macro :Array<Point>;
				case "portPos":
					macro :PortPos;
				case "quadType":
					macro :QuadType;
				case "rankdir":
					macro :RankDir;
				case "rankType":
					macro :RankType;
				case "rect":
					macro :Rectangle;
				case "shape":
					macro :Shape;
				case "smoothType":
					macro :SmoothType;
				case "spline":
					macro :Spline;
				case "string":
					switch (doc.title) {
						case "imagescale":
							// Stupid workaround for Haxe's completion not working well with argument skipping
							swap = true;
							macro :ImageScale;
						case "splines":
							swap = true;
							macro :Spline;
						case _:
							macro :String;
					}
				case "escString" | "lblString" | "startType" | "viewPort" | "layer" | "splineType":
					macro :String;
				case "style":
					macro :Style;
				case "xdot":
					macro :String; // ???
				case s:
					throw 'Unknown type: $s (on ${doc.title})';
			};
		}
		var argTypes = doc.types.map(s -> mapType(s));
		if (swap) {
			argTypes.reverse();
		}
		function mapUsedBy(s:String) {
			return switch (s) {
				case "G": macro :G;
				case "E": macro :E;
				case "N": macro :N;
				case "C" | "S": macro :C;
				case s: throw 'Unknown used_by value: $s (on ${doc.title})';
			}
		}
		var retSplit = doc.usedBy.split("");
		var retType = if (retSplit.length == 4) {
			macro :All;
		} else if (retSplit.length < 4) {
			var baseName = "A" + retSplit.length;
			var params = retSplit.map(s -> TPType(mapUsedBy(s)));
			TPath({pack: [], name: baseName, params: params});
		} else {
			throw 'Too many entries in used_by: ${doc.usedBy} (on ${doc.title})';
		}
		var i = 0;
		var seeTitle = switch (doc.title) {
			case "_background": "background";
			case s: s;
		}
		var seePath = "https://graphviz.org/docs/attrs/" + seeTitle + "/";
		var ef:Field = {
			name: capitalize(doc.title),
			doc: doc.description + "\n\n@see " + seePath,
			kind: FFun({
				args: argTypes.map(argType -> {
					name: (argTypes.length > 1 ? "v" + i++ : "v"),
					"type": argType,
					meta: [],
					opt: argTypes.length > 1,
					value: null
				}),
				ret: retType,
			}),
			pos: p
		}
		return ef;
	}

	static function main() {
		var docsFolder = "./graphviz.gitlab.io/content/en/docs";
		var attrsFolder = Path.join([docsFolder, "attrs"]);
		var fields = [];
		for (file in FileSystem.readDirectory(attrsFolder)) {
			if (file.startsWith("_")) {
				continue;
			}
			file = Path.join([attrsFolder, file]);
			var content = File.getContent(file);
			var doc = new Document();
			var p = Context.makePosition({min: 0, max: 0, file: file});
			var md = new markdown.BlockParser(content.split("\n"), doc);

			function readArray(a) {
				while (md.next.startsWith("-")) {
					a.push(md.next.substr(1).trim());
					md.advance();
				}
			}

			var doc:AttributeDoc = {
				defaults: [],
				flags: [],
				minimums: [],
				title: "",
				types: [],
				usedBy: "",
				description: ""
			};
			var next;
			while ((next = md.next) != null) {
				var split = next.split(":");
				md.advance();
				var key = split.shift();
				var value = split.join(":").trim();
				switch (key) {
					case "defaults":
						readArray(doc.defaults);
					case "flags":
						readArray(doc.flags);
					case "minimums":
						readArray(doc.minimums);
					case "types":
						readArray(doc.types);
					case "title":
						doc.title = value;
					case "used_by":
						if (value.charCodeAt(0) == '"'.code) {
							value = value.substr(1, -1);
						}
						doc.usedBy = value;
					case "description":
						doc.description = value;
				}
			}
			var ef = makeField(doc, p);
			fields.push(ef);
		}

		var td = {
			pack: [],
			name: "Attribute",
			params: [{name: "T"}],
			pos: Context.makePosition({min: 0, max: 0, file: "AttributeGenerator.hx"}),
			kind: TDEnum,
			fields: fields
		}
		var content = new haxe.macro.Printer().printTypeDefinition(td);

		var path = "../src/dot/Attribute.hx";

		var original = File.getContent(path);
		var splitIndicator = "// Split";
		var split = original.split(splitIndicator);
		split[1] = "\n\n" + content + "\n\n";
		var changed = split.join(splitIndicator);
		File.saveContent(path, changed);
	}
}
