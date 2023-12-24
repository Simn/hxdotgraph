package dot;

import dot.Attribute;

class Graph extends NodeHost {
	var attrs:Array<Attribute<GraphAttribute>>;
	var isDigraph:Bool;

	public function new(attrs:Array<Attribute<GraphAttribute>>, isDigraph = true) {
		super("n");
		this.attrs = attrs;
		this.isDigraph = isDigraph;
	}

	public function getDotCode() {
		var buffer = new StringBuf();
		if (isDigraph) {
			buffer.add("digraph {\n");
		} else {
			buffer.add("graph {\n");
		}
		var indentation = "\t";
		for (attr in attrs) {
			buffer.add(indentation);
			buffer.add(Printer.printAttribute(attr));
			buffer.add(";\n");
		}
		getInternalDotCode(buffer, indentation, isDigraph);
		buffer.add("");
		buffer.add("}");
		return buffer.toString();
	}
}
