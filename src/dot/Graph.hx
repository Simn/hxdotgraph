package dot;

import dot.Attribute;

class Graph extends NodeHost {
	var attributes:Array<Attribute<GraphAttribute>>;
	var isDigraph:Bool;

	public function new(?attributes:Array<Attribute<GraphAttribute>>, isDigraph = true) {
		super("n");
		this.attributes = attributes ?? [];
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
		for (attribute in attributes) {
			buffer.add(indentation);
			buffer.add(Printer.printAttribute(attribute));
			buffer.add(";\n");
		}
		getInternalDotCode(buffer, indentation, isDigraph);
		buffer.add("");
		buffer.add("}");
		return buffer.toString();
	}
}
