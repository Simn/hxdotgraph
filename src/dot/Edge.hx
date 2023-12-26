package dot;

import dot.Attribute;

class Edge implements DotPrinter {
	public var from:Node;
	public var to:Node;
	public var attributes:Array<Attribute<EdgeAttribute>>;

	var host:NodeHost;

	@:allow(dot.NodeHost)
	function new(host:NodeHost, from:Node, to:Node, ?attributes:Array<Attribute<EdgeAttribute>>) {
		this.host = host;
		this.from = from;
		this.to = to;
		this.attributes = attributes ?? [];
	}

	public function getDotCode(indentation:String, isDigraph:Bool):String {
		var buffer = new StringBuf();
		var edgeString = isDigraph ? "->" : "--";
		buffer.add(indentation);
		buffer.add('${from.name} $edgeString ${to.name}');
		buffer.add(Printer.printAttributes(attributes));
		buffer.add(";\n");
		return buffer.toString();
	}
}
