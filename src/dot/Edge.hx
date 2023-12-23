package dot;

class Edge implements DotPrinter {
	public var from:Node;
	public var to:Node;
	public var attrs:Array<Attribute>;

	var host:NodeHost;

	@:allow(dot.NodeHost)
	function new(host:NodeHost, from:Node, to:Node, attrs:Array<Attribute> = null) {
		this.host = host;
		this.from = from;
		this.to = to;
		this.attrs = attrs ?? [];
	}

	public function getDotCode(indentation:String, isDigraph:Bool):String {
		var buffer = new StringBuf();
		var edgeString = isDigraph ? "->" : "--";
		buffer.add(indentation);
		buffer.add('${from.name} $edgeString ${to.name}');
		buffer.add(Printer.printAttributes(attrs));
		buffer.add(";\n");
		return buffer.toString();
	}
}
