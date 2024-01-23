import dot.Attribute;
import dot.Node;
import dot.Graph;
import sys.io.File;
import sys.FileSystem;
import haxe.io.Path;
import haxe.macro.Compiler;

using StringTools;

typedef DepNode = {
	var node:Null<Node>;
	var deps:Array<String>;
	var revDeps:Array<DepNode>;
	var generated:Bool;
}

function capitalize(s:String) {
	return s.substr(0, 1).toUpperCase() + s.substr(1);
}

typedef IdomInfo = {
	var node:Node;
	var parent:IdomInfo;
	var idom:IdomInfo;
	var semi:Int;
	var label:IdomInfo;
	var ancestor:IdomInfo;
	var bucket:Array<IdomInfo>;
}

function inferIdom(graph:Graph, root:Node) {
	var infoLut = new Map();
	var infos = [];
	function addInfo(node:Node, nodeParent:Node) {
		var info:IdomInfo = {
			node: node,
			parent: null,
			idom: null,
			semi: infos.length,
			label: null,
			ancestor: null,
			bucket: []
		}
		info.idom = info.label = info.ancestor = info;
		if (node == nodeParent) {
			info.parent = info;
		} else {
			info.parent = infoLut[nodeParent.name];
		}
		infoLut[node.name] = info;
		infos.push(info);
	}
	function loop(node:Node, nodeParent:Node) {
		addInfo(node, nodeParent);
		node.iterateOutgoing(edge -> {
			var nodeTo = edge.to;
			if (!infoLut.exists(nodeTo.name)) {
				loop(nodeTo, node);
			}
		});
	}
	loop(root, root);
	function compress(info:IdomInfo) {
		var worklist = [info];
		{
			var info = info.ancestor;
			while (info.ancestor != info) {
				worklist.push(info);
				info = info.ancestor;
			}
		}
		var predInfo = worklist.pop();
		var minSemi = predInfo.label.semi;

		var counter = worklist.length;
		while (counter-- > 0) {
			var infoDesc = worklist[counter];
			var info = infoDesc.label;
			if (info.semi > minSemi) {
				infoDesc.label = predInfo.label;
				predInfo = infoDesc;
			} else {
				minSemi = info.semi;
				predInfo = infoDesc;
			}
		}
	}

	function eval(name:String) {
		var info = infoLut[name];
		return if (info.ancestor != info) {
			compress(info);
			info.label;
		} else {
			info;
		}
	}

	var counter = infos.length;
	while (counter-- > 1) { // skip root
		var info = infos[counter];
		var semi = info.semi;
		info.node.iterateIncoming(edge -> {
			var semi2 = eval(edge.from.name).semi;
			if (semi2 < semi) {
				semi = semi2;
			}
		});
		info.semi = semi;
		var infoSemi = infos[semi];
		infoSemi.bucket.push(info);
		var infoParent = info.parent;
		info.ancestor = infoParent;
		for (v in infoParent.bucket) {
			var u = eval(v.node.name);
			if (u.semi < v.semi) {
				v.idom = u;
			} else {
				v.idom = infoParent;
			}
		}
		infoParent.bucket = [];
	}
	for (i in 1...infos.length) {
		var info = infos[i];
		if (info.idom != infos[info.semi]) {
			info.idom = info.idom.idom;
		}
	}
	// graph.iterateEdges(edge -> edge.remove());
	for (info in infos) {
		if (info.idom != info) {
			var node = info.node;
			var node2 = info.idom.node;
			if (node != node2) {
				node2.iterateOutgoing(edge -> if (edge.to == node) edge.remove());
				graph.edge(node2, node, [Color(Red)]);
			}
		}
	}
}

function main() {
	var graph = new Graph([Splines(Curved), Overlap("scale")]);
	var haxeBuildPath = Compiler.getDefine("HAXE_BUILD_PATH");
	if (haxeBuildPath == null) {
		return;
	}
	var depRoot = Compiler.getDefine("DEP_ROOT");
	if (depRoot == null) {
		return;
	}
	depRoot = capitalize(depRoot);
	var stopNodes = [];
	var ignoreNodes = ["Globals"];
	var haxeObjsPath = Path.join([haxeBuildPath, "_build", "default", "src", ".haxe.objs"]);
	var nodes:Map<String, DepNode> = new Map();
	for (file in FileSystem.readDirectory(haxeObjsPath)) {
		if (!file.endsWith(".d")) {
			continue;
		}
		var content = File.getContent(Path.join([haxeObjsPath, file])).trim();
		var split = content.split(":");
		var name = split[0].trim();
		var deps = split[1].trim().split(" ");
		var key = capitalize(new Path(name).file);
		nodes[key] = {
			node: null,
			deps: deps,
			revDeps: [],
			generated: false
		}
	}

	var edgeAttributes:Array<Attribute<EdgeAttribute>> = [Style(Dotted), Constraint(false)];
	var workList = [depRoot];
	while (workList.length > 0) {
		var currentList = workList;
		workList = [];
		for (key => node in nodes) {
			if (!currentList.contains(key) || ignoreNodes.contains(key)) {
				continue;
			}
			node.generated = true;
			node.node = graph.node([Label(key)]);
			for (revDep in node.revDeps) {
				revDep.node.connect(node.node, edgeAttributes);
			}
			if (stopNodes.contains(key)) {
				continue;
			}
			for (dep in node.deps) {
				var depNode = nodes[dep];
				if (depNode == null) {
					continue;
				}
				if (!depNode.generated) {
					if (!workList.contains(dep) && !currentList.contains(dep)) {
						workList.push(dep);
					}
					depNode.revDeps.push(node);
				} else {
					node.node.connect(depNode.node, edgeAttributes);
				}
			}
		}
	}

	if (nodes[depRoot] != null) {
		inferIdom(graph, nodes[depRoot].node);
	}

	File.saveContent("haxeDependencies.dot", graph.getDotCode());
}
