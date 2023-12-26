package dot;

import dot.Attribute;

class Node implements DotPrinter {
	public var name:String;
	public var attributes:Array<Attribute<NodeAttribute>>;

	var host:NodeHost;

	@:allow(dot.Graph, dot.NodeHost)
	function new(host:NodeHost, name:String, ?attributes:Array<Attribute<NodeAttribute>>) {
		this.host = host;
		this.name = name;
		this.attributes = attributes ?? [];
	}

	public function connect(to:Node, ?attributes:Array<Attribute<EdgeAttribute>>) {
		host.edge(this, to, attributes);
	}

	public function clone() {
		return host.node(attributes.copy());
	}

	public function getDotCode(indentation:String, isDigraph:Bool):String {
		var buffer = new StringBuf();
		buffer.add(indentation);
		buffer.add(name);
		buffer.add(Printer.printAttributes(attributes));
		buffer.add(";\n");
		return buffer.toString();
	}
}
