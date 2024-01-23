package dot;

import dot.Attribute;

class Node implements DotPrinter {
	public var name:String;
	public var attributes:Array<Attribute<NodeAttribute>>;

	var incoming:Array<Edge>;
	var outgoing:Array<Edge>;

	var host:NodeHost;

	@:allow(dot.Graph, dot.NodeHost)
	function new(host:NodeHost, name:String, ?attributes:Array<Attribute<NodeAttribute>>) {
		this.host = host;
		this.name = name;
		this.attributes = attributes ?? [];
		incoming = [];
		outgoing = [];
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

	@:allow(dot.NodeHost)
	function addIncoming(edge:Edge) {
		incoming.push(edge);
	}

	@:allow(dot.NodeHost)
	function addOutgoing(edge:Edge) {
		outgoing.push(edge);
	}

	@:allow(dot.NodeHost)
	function removeIncoming(edge:Edge) {
		incoming.remove(edge);
	}

	@:allow(dot.NodeHost)
	function removeOutgoing(edge:Edge) {
		outgoing.remove(edge);
	}

	public function iterateIncoming(f:Edge->Void) {
		for (edge in incoming.copy()) {
			f(edge);
		}
	}

	public function iterateOutgoing(f:Edge->Void) {
		for (edge in outgoing.copy()) {
			f(edge);
		}
	}
}
