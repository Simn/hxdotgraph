enum abstract Resource(String) {
	var Coal;
	var Stone;
	var IronOre;
	var CopperOre;
	var Oil;

	var IronPlates;
	var CopperPlates;
	var SteelPlates;
	var Bricks;

	var HeavyOil;
	var LightOil;
	var PetroleumGas;
	var SulfuricAcid;
	var Lubricant;

	var Concrete;
	var Plastic;
	var LowDensityStructures;
	var Accumulators;
	var Batteries;
	var FlyingRobotFrames;

	var GreenCircuits;
	var AdvancedCircuits;
	var ProcessingUnits;
	var Modules;

	var SolidFuel;
	var RocketFuel;
	var RocketControlUnits;
	var Satellite;

	var Radars;
	var SolarPanels;

	var Flasks;
	var SpaceScience;

	public function toString() {
		return this;
	}
}

function main() {
	var graph = new dot.Graph([Splines(Ortho)]);

	function subgraph(inputs:Array<Resource>, outputs:Array<Resource>, ?name:String) {
		name ??= outputs.map(r -> r.toString()).join(" & ");
		var cluster = graph.subgraph([Label(name), Style(Filled), Color([Lightblue])]);
		for (input in inputs) {
			cluster.node([Label(input.toString()), Shape(Box)]);
		}
		for (output in outputs) {
			cluster.node([Label(output.toString())]);
		}
	}

	// Raw

	subgraph([], [Coal]);
	subgraph([], [Stone]);
	subgraph([], [IronOre]);
	subgraph([], [CopperOre]);
	subgraph([], [Oil]);

	// Smelting

	subgraph([IronOre], [IronPlates], "Iron plates smelter");
	subgraph([CopperOre], [CopperPlates], "Copper plates smelter");
	subgraph([IronOre], [SteelPlates], "Steel plates smelter");
	subgraph([Stone], [Bricks], "Bricks smelter");

	// Fluids

	subgraph([Oil], [HeavyOil, LightOil, PetroleumGas], "Refineries");
	subgraph([IronPlates, PetroleumGas], [SulfuricAcid]);
	subgraph([HeavyOil], [Lubricant]);

	// Intermediate

	subgraph([IronOre, Bricks], [Concrete]);
	subgraph([Coal, PetroleumGas], [Plastic]);
	subgraph([CopperPlates, Plastic, SteelPlates], [LowDensityStructures]);
	subgraph([CopperPlates, IronPlates, SulfuricAcid], [Batteries, Accumulators]);
	subgraph([IronPlates, GreenCircuits, SteelPlates, Batteries], [FlyingRobotFrames]);

	// Electronics

	subgraph([CopperPlates, IronPlates], [GreenCircuits]);
	subgraph([CopperPlates, GreenCircuits, Plastic], [AdvancedCircuits]);
	subgraph([GreenCircuits, AdvancedCircuits, SulfuricAcid], [ProcessingUnits]);
	subgraph([GreenCircuits, AdvancedCircuits, ProcessingUnits], [Modules]);

	// Rocket

	subgraph([LightOil], [RocketFuel, SolidFuel]);

	subgraph([GreenCircuits, AdvancedCircuits, ProcessingUnits], [RocketControlUnits]);

	subgraph([
		ProcessingUnits,
		LowDensityStructures,
		RocketFuel,
		SolarPanels,
		Accumulators,
		Radars
	], [Satellite]);

	subgraph([LowDensityStructures, RocketFuel, RocketControlUnits, Satellite], [SpaceScience], "Rocket");

	// Output

	subgraph([
		Coal, Stone, Bricks, IronPlates, CopperPlates, SteelPlates, GreenCircuits, AdvancedCircuits, ProcessingUnits, LowDensityStructures, FlyingRobotFrames,
		PetroleumGas
	], [Flasks]);

	subgraph([
		IronPlates,
		CopperPlates,
		SteelPlates,
		Bricks,
		Lubricant,
		GreenCircuits,
		AdvancedCircuits,
		Concrete
	], [SolarPanels, Radars], "Mall");

	subgraph([Flasks, SpaceScience], [], "Science");

	// Infer connections

	var outputs = new Map();
	var inputs = [];

	graph.iterateNodes(node -> {
		var label = null;
		var shape = null;
		for (attribute in node.attributes) {
			switch (attribute) {
				case Label(s):
					label = s;
				case Shape(sh):
					shape = sh;
				case _:
			}
		}
		if (label != null) {
			switch (shape) {
				case null:
					if (outputs.exists(label)) {
						Sys.println('Duplicate output: $label');
					}
					outputs[label] = node;
				case Box:
					inputs.push({label: label, node: node});
				case _:
			}
		}
	});

	for (input in inputs) {
		var source = outputs[input.label];
		if (source != null) {
			graph.edge(source, input.node);
		} else {
			Sys.println('Could not find input for resource ${input.label}');
		}
	}

	sys.io.File.saveContent("factorio.dot", graph.getDotCode());
}
