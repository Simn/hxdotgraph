import sys.io.File;

using StringTools;

typedef DepNode = {
	node:dot.Node,
	to:Array<String>
}

function main() {
	var contents = File.getContent("dump/eval/dependencies.dump");
	var lines = contents.split("\n");
	var graph = new dot.Graph([Splines(Curved)]);
	var nodeLut = new Map();
	var current:DepNode = null;
	var packages = new Map();
	function locatePackage(parts:Array<String>) {
		var pack = parts.slice(0, -1).join("/");
		if (packages.exists(pack)) {
			return packages[pack];
		}
		var cluster = graph.subgraph([Label(pack)]);
		packages[pack] = cluster;
		return cluster;
	}
	for (line in lines) {
		line = line.replace("\\", "/");
		if (line.startsWith("\t")) {
			current.to.push(line.trim());
		} else if (line.length > 0) {
			line = line.trim().substr(0, -1); // :
			var split = line.split("/");
			var cluster = locatePackage(split);
			current = {
				node: cluster.node([Label(split[split.length - 1].substr(0, -3))]),
				to: []
			}
			nodeLut[line] = current;
		}
	}
	for (_ => node in nodeLut) {
		for (to in node.to) {
			var toNode = nodeLut[to];
			if (toNode != null) {
				graph.edge(node.node, toNode.node, [Color([Gray])]);
			}
		}
	}

	File.saveContent("dependencies.dot", graph.getDotCode());
}
