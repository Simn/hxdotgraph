package dot;

import dot.Attribute;

class Node implements DotPrinter {
	public var name:String;
	public var attrs:Array<Attribute<NodeAttribute>>;

	var host:NodeHost;

	@:allow(dot.Graph, dot.NodeHost)
	function new(host:NodeHost, name:String, attrs:Array<Attribute<NodeAttribute>>) {
		this.host = host;
		this.name = name;
		this.attrs = attrs;
	}

	public function connect(to:Node, attrs:Array<Attribute<EdgeAttribute>>) {
		host.edge(this, to, attrs);
	}

	public function clone() {
		return host.node(attrs.copy());
	}

	public function getDotCode(indentation:String, isDigraph:Bool):String {
		var buffer = new StringBuf();
		buffer.add(indentation);
		buffer.add(name);
		buffer.add(Printer.printAttributes(attrs));
		buffer.add(";\n");
		return buffer.toString();
	}
}
