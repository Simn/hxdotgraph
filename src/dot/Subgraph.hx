package dot;

import dot.Attribute;

using StringTools;

class Subgraph extends NodeHost implements DotPrinter {
	public var name:String;
	public var attributes:Array<Attribute<ClusterAttribute>>;

	var host:NodeHost;

	@:allow(dot.NodeHost)
	function new(host:NodeHost, name:String, ?attributes:Array<Attribute<ClusterAttribute>>) {
		super(name.replace(" ", "_"));
		this.host = host;
		this.name = name;
		this.attributes = attributes ?? [];
	}

	public function getDotCode(indentation:String, isDigraph:Bool):String {
		var buffer = new StringBuf();
		buffer.add(indentation);
		var indentation2 = indentation + "\t";
		buffer.add("subgraph ");
		buffer.add(name);
		buffer.add(" {\n");
		for (attribute in attributes) {
			buffer.add(indentation2);
			buffer.add(Printer.printAttribute(attribute));
			buffer.add(";\n");
		}
		getInternalDotCode(buffer, indentation2, isDigraph);
		buffer.add(indentation);
		buffer.add("}\n");
		return buffer.toString();
	}
}
