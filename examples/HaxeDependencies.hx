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

function main() {
	var graph = new Graph([Splines(Curved)]);
	var haxeBuildPath = Compiler.getDefine("HAXE_BUILD_PATH");
	if (haxeBuildPath == null) {
		return;
	}
	var depRoots = Compiler.getDefine("DEP_ROOTS");
	if (depRoots == null) {
		return;
	}
	var depRoots = depRoots.split(",").map(capitalize);
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

	var edgeAttributes = [Color(Gray)];
	var workList = depRoots.copy();
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

	File.saveContent("haxeDependencies.dot", graph.getDotCode());
}
