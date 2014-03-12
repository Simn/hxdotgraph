package dot;

import dot.Attribute;

class Edge {
	public var from:Node;
	public var to:Node;
	public var attrs:Array<Attribute>;
	var graph:Graph;
	
	@:allow(dot.Graph)
	function new(graph:Graph, from:Node, to:Node, attrs:Array<Attribute>) {
		this.graph = graph;
		this.from = from;
		this.to = to;
		this.attrs = attrs;
	}
}

class Graph {
	var attrs:Array<Attribute>;
	var nodes:Array<Node> = [];
	var edges:Array<Edge> = [];
	var isDigraph:Bool;
	
	public function new(attrs:Array<Attribute>, isDigraph = true) {
		this.attrs = attrs;
		this.isDigraph = isDigraph;
	}

	public function global(attrs:Array<Attribute>) {
		nodes.push(new Node(this, "node", attrs));
	}

	public function node(attrs:Array<Attribute>) {
		var node = new Node(this, "n" + nodes.length, attrs);
		nodes.push(node);
		return node;
	}

	public function edge(from:Node, to:Node, attrs:Array<Attribute>) {
		var edge = new Edge(this, from, to, attrs);
		edges.push(edge);
		return edge;
	}

	public function getDotCode() {
		var buffer = new StringBuf();
		if (isDigraph) {
			buffer.add("digraph {\n");
		} else {
			buffer.add("graph {\n");
		}
		for (attr in attrs) {
			buffer.add(Printer.printAttribute(attr));
			buffer.add(";\n");
		}
		for (node in nodes) {
			buffer.add(node.name);
			buffer.add(Printer.printAttributes(node.attrs));
			buffer.add(";\n");
		}
		var edgeString = isDigraph ? "->" : "--";
		for (edge in edges) {
			buffer.add('${edge.from.name} $edgeString ${edge.to.name}');
			buffer.add(Printer.printAttributes(edge.attrs));
			buffer.add(";\n");
		}
		buffer.add("}");
		return buffer.toString();
	}
}