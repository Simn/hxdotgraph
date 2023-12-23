package dot;

import dot.*;

abstract class NodeHost {
	var prefix:String;
	var subgraphs:Array<Subgraph> = [];
	var nodes:Array<Node> = [];
	var edges:Array<Edge> = [];

	function new(prefix:String) {
		this.prefix = prefix;
	}

	public function global(attrs:Array<Attribute>) {
		nodes.push(new Node(this, "node", attrs));
	}

	public function node(attrs:Array<Attribute>) {
		var node = new Node(this, prefix + "_" + nodes.length, attrs);
		nodes.push(node);
		return node;
	}

	public function edge(from:Node, to:Node, attrs:Array<Attribute> = null) {
		var edge = new Edge(this, from, to, attrs ?? []);
		edges.push(edge);
		return edge;
	}

	public function subgraph(attrs:Array<Attribute>) {
		var subgraph = new Subgraph(this, "cluster_" + subgraphs.length, attrs);
		subgraphs.push(subgraph);
		return subgraph;
	}

	function getInternalDotCode(buffer:StringBuf, indentation:String, isDigraph:Bool) {
		for (subgraph in subgraphs) {
			buffer.add(subgraph.getDotCode(indentation, isDigraph));
		}
		for (node in nodes) {
			buffer.add(node.getDotCode(indentation, isDigraph));
		}
		for (edge in edges) {
			buffer.add(edge.getDotCode(indentation, isDigraph));
		}
	}
}
