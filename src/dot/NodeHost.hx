package dot;

import dot.Attribute;
import dot.*;

abstract class NodeHost {
	var prefix:String;
	var subgraphs:Array<Subgraph> = [];
	var nodes:Array<Node> = [];
	var edges:Array<Edge> = [];

	function new(prefix:String) {
		this.prefix = prefix;
	}

	public function global(attributes:Array<Attribute<NodeAttribute>>) {
		nodes.push(new Node(this, "node", attributes));
	}

	public function node(attributes:Array<Attribute<NodeAttribute>>) {
		var node = new Node(this, prefix + "_" + nodes.length, attributes);
		nodes.push(node);
		return node;
	}

	public function edge(from:Node, to:Node, ?attributes:Array<Attribute<EdgeAttribute>>) {
		var edge = new Edge(this, from, to, attributes ?? []);
		edges.push(edge);
		return edge;
	}

	public function subgraph(?attributes:Array<Attribute<ClusterAttribute>>) {
		var subgraph = new Subgraph(this, "cluster_" + subgraphs.length, attributes);
		subgraphs.push(subgraph);
		return subgraph;
	}

	public function iterateNodes(f:Node->Void) {
		for (node in nodes) {
			f(node);
		}
		for (subgraph in subgraphs) {
			subgraph.iterateNodes(f);
		}
	}

	public function iterateEdges(f:Edge->Void) {
		for (edge in edges) {
			f(edge);
		}
		for (subgraph in subgraphs) {
			subgraph.iterateEdges(f);
		}
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
