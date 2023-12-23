package dot;

using StringTools;

class Subgraph extends NodeHost implements DotPrinter {
	public var name:String;
	public var attrs:Array<Attribute>;

	var host:NodeHost;

	@:allow(dot.NodeHost)
	function new(host:NodeHost, name:String, attrs:Array<Attribute>) {
		super(name.replace(" ", "_"));
		this.host = host;
		this.name = name;
		this.attrs = attrs;
	}

	public function getDotCode(indentation:String, isDigraph:Bool):String {
		var buffer = new StringBuf();
		buffer.add(indentation);
		var indentation2 = indentation + "\t";
		buffer.add("subgraph ");
		buffer.add(name);
		buffer.add(" {\n");
		for (attr in attrs) {
			buffer.add(indentation2);
			buffer.add(Printer.printAttribute(attr));
			buffer.add(";\n");
		}
		getInternalDotCode(buffer, indentation2, isDigraph);
		buffer.add(indentation);
		buffer.add("}\n");
		return buffer.toString();
	}
}
