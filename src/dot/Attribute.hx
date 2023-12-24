package dot;

import haxe.extern.EitherType as ET;

class GraphAttribute {}
class NodeAttribute {}
class EdgeAttribute {}
class ClusterAttribute {}
private typedef G = GraphAttribute;
private typedef N = NodeAttribute;
private typedef E = EdgeAttribute;
private typedef C = ClusterAttribute;
private typedef A1<A> = Attribute<A>;
private typedef A2<A, B> = Attribute<ET<A, B>>;
private typedef A3<A, B, C> = Attribute<ET<A, ET<B, C>>>;
private typedef All = Attribute<ET<G, ET<N, ET<E, C>>>>;

enum Attribute<T> {
	Area(f:Float):A2<N, C>;
	ArrowHead(at:ArrowType):A1<E>;
	ArrowSize(f:Float):A1<E>;
	ArrowTail(at:ArrowType):A1<E>;
	BB(rect:Rectangle):A1<G>;
	BGColor(c:Color):A2<G, C>;
	Center(b:Bool):A1<G>;
	Charset(s:String):A1<G>;
	ClusterRank(cm:ClusterMode):A1<G>;
	Color(cl:Array<Color>):A3<E, N, C>;
	ColorScheme(s:String):All;
	Comment(s:String):A3<E, N, G>;
	Compound(b:Bool):A1<G>;
	Concentrate(b:Bool):A1<G>;
	Constraint(b:Bool):A1<E>;
	Decorate(b:Bool):A1<E>;
	DefaultDist(f:Float):A1<G>;
	Dim(i:Int):A1<G>;
	Dimen(i:Int):A1<G>;
	Dir(dt:DirType):A1<E>;
	DirEdgeConstraints(s:String):A1<G>;
	Distortion(f:Float):A1<N>;
	DPI(f:Float):A1<G>;
	EdgeUrl(s:String):A1<E>;
	EdgeHref(s:String):A1<E>;
	EdgeTarget(s:String):A1<E>;
	EdgeTooltip(s:String):A1<E>;
	Epsilon(f:Float):A1<G>;
	ESep(dop:DoubleOrPoint, add:Bool):A1<G>;
	FillColor(c:Color):A3<E, N, C>;
	FixedSize(b:Bool):A1<N>;
	FontColor(c:Color):All;
	FontName(s:String):All;
	FontNames(s:String):A1<G>;
	FontPath(s:String):A1<G>;
	FontSize(f:Float):All;
	ForceLabels(b:Bool):A1<G>;
	GradientAngle(i:Int):A3<N, C, G>;
	Group(s:String):A1<N>;
	HeadClip(b:Bool):A1<E>;
	HeadHref(s:String):A1<E>;
	HeadLabel(s:String):A1<E>;
	HeadLp(p:Point):A1<E>;
	HeadPort(pp:PortPos):A1<E>;
	HeadTarget(s:String):A1<E>;
	HeadTooltip(s:String):A1<E>;
	HeadUrl(s:String):A1<E>;
	Height(f:Float):A1<N>;
	Href(s:String):All;
	Id(s:String):All;
	Image(s:String):A1<N>;
	ImagePath(s:String):A1<G>;
	ImageScale(ims:ImageScale):A1<N>;
	InputScale(f:Float):A1<G>;
	Label(s:String):All;
	LabelScheme(i:Int):A1<G>;
	LabelAngle(f:Float):A1<E>;
	LabelDistance(f:Float):A1<E>;
	LabelFloat(b:Bool):A1<E>;
	LabelFontColor(c:Color):A1<E>;
	LabelFontName(s:String):A1<E>;
	LabelFontSize(f:Float):A1<E>;
	LabelHref(s:String):A1<E>;
	LabelJust(s:String):A2<G, C>;
	LabelLoc(s:String):A3<N, G, C>;
	LabelTarget(s:String):A1<E>;
	LabelTooltip(s:String):A1<E>;
	LabelUrl(s:String):A1<E>;
	Landscape(b:Bool):A1<G>;
	Layer(s:String):A3<E, N, C>;
	LayerListSep(s:String):A1<G>;
	Layers(s:String):A1<G>;
	LayerSelect(s:String):A1<G>;
	LayerSep(s:String):A1<G>;
	Layout(s:String):A1<G>;
	Len(f:Float):A1<E>;
	Levels(i:Int):A1<G>;
	LevelsGap(f:Float):A1<G>;
	LHead(s:String):A1<E>;
	LHeight(f:Float):A2<G, C>;
	Lp(p:Point):A3<E, G, C>;
	LTail(s:String):A1<E>;
	LWidth(f:Float):A2<G, C>;
	Margin(dop:DoubleOrPoint):A3<N, C, G>;
	MaxIter(i:Int):A1<G>;
	McLimit(f:Float):A1<G>;
	MinDist(f:Float):A1<G>;
	MinLen(i:Int):A1<E>;
	Mode(s:String):A1<G>;
	Model(s:String):A1<G>;
	Newrank(b:Bool):A1<G>;
	NodeSep(f:Float):A1<G>;
	NoJustify(b:Bool):All;
	Normalize(f:Float):A1<G>;
	NsLimit(f:Float):A1<G>;
	Ordering(s:String):A2<G, N>;
	Orientation(dos:DoubleOrString):A2<N, G>;
	OutputOrder(om:OutputMode):A1<G>;
	Overlap(s:String):A1<G>;
	OverlapScaling(f:Float):A1<G>;
	OverlapShrink(b:Bool):A1<G>;
	Pack(boi:BoolOrInt):A1<G>;
	Packmode(pm:PackMode):A1<G>;
	Pad(dop:DoubleOrPoint):A1<G>;
	Page(dop:DoubleOrPoint):A1<G>;
	PageDir(pdir:PageDir):A1<G>;
	PenColor(c:Color):A1<C>;
	PenWidth(f:Float):A3<C, N, E>;
	Peripheries(i:Int):A2<N, C>;
	Pin(b:Bool):A1<N>;
	Pos(post:PointOrSplineType):A2<E, N>;
	Quadtree(boq:BoolOrQuadType):A1<G>;
	Quantum(f:Float):A1<G>;
	Rank(rt:RankType):A1<C>;
	RankDir(rd:RankDir):A1<G>;
	RankSep(fl:Array<Float>):A1<G>;
	Ratio(dos:DoubleOrString):A1<G>;
	Rects(rect:Rectangle):A1<N>;
	Regular(b:Bool):A1<N>;
	Remincross(b:Bool):A1<G>;
	RepulsiveForce(f:Float):A1<G>;
	Resolution(f:Float):A1<G>;
	Root(s:String):A2<G, N>;
	Rotate(i:Int):A1<G>;
	Rotation(f:Float):A1<G>;
	SameHead(s:String):A1<E>;
	SameTail(s:String):A1<E>;
	SamplePoint(o:Int):A1<N>;
	Scale(dop:DoubleOrPoint):A1<G>;
	SearchSize(i:Int):A1<G>;
	Sep(dop:DoubleOrPoint, add:Bool):A1<G>;
	Shape(sh:Shape):A1<N>;
	Shapefile(s:String):A1<N>;
	Showboxes(i:Int):A3<E, N, G>;
	Sides(i:Int):A1<N>;
	Size(dop:DoubleOrPoint):A1<G>;
	Skew(f:Float):A1<N>;
	Smoothing(st:SmoothType):A1<G>;
	Sortv(i:Int):A3<G, C, N>;
	Splines(spline:Spline):A1<G>;
	Start(s:String):A1<G>;
	Style(st:Style):All;
	Stylesheet(s:String):A1<G>;
	TailUrl(s:String):A1<E>;
	TailLp(p:Point):A1<E>;
	TailClip(b:Bool):A1<E>;
	TailHref(s:String):A1<E>;
	TailLabel(s:String):A1<E>;
	TailPort(pp:PortPos):A1<E>;
	TailTarget(s:String):A1<E>;
	TailTooltip(s:String):A1<E>;
	Target(s:String):All;
	Tooltip(s:String):All;
	Truecolor(b:Bool):A1<G>;
	Vertices(pl:Array<Point>):A1<N>;
	Viewport(s:String):A1<G>;
	VoroMargin(f:Float):A1<G>;
	Weight(f:Float):A1<E>;
	Width(f:Float):A1<N>;
	XDotVersion(s:String):A1<G>;
	XLabel(s:String):A2<E, N>;
	XLp(p:Point):A2<N, E>;
	Z(f:Float):A1<N>;
}

typedef AddDouble = {
	var f:Float;
	var add:Bool;
}

typedef AddPoint = {
	var point:Point;
	var add:Bool;
}

enum ArrowType {
	Normal;
	Dot;
	ODot;
	None;
	Empty;
	Diamond;
	EDiamond;
	Box;
	Open;
	Vee;
	Inv;
	InvDot;
	InvODot;
	Tee;
	InvEmpty;
	ODiamond;
	Crow;
	OBox;
	HalfOpen;
	Circle;
}

enum BoolOrInt {
	Bool(b:Bool);
	Int(i:Int);
}

enum BoolOrQuadType {
	Bool(b:Bool);
	QuadType(qt:QuadType);
}

enum ClusterMode {
	Local;
	Global;
	None;
}

enum CompassPoint {
	N;
	NE;
	E;
	SE;
	S;
	SW;
	W;
	NW;
	C;
	_;
}

enum DirType {
	Forward;
	Back;
	Both;
	None;
}

enum DoubleOrPoint {
	Double(f:Float);
	Point(p:Point);
}

enum DoubleOrString {
	Double(f:Float);
	String(s:String);
}

enum ImageScale {
	False;
	True;
	Width;
	Height;
	Both;
}

enum OutputMode {
	BreadthFirst;
	NodesFirst;
	EdgesFirst;
}

enum PackMode {
	Node;
	Clust;
	Graph;
	Array(flags:String, ?n:Int);
}

enum PageDir {
	BL;
	BR;
	TL;
	TR;
	RB;
	RT;
	LB;
	LT;
}

typedef Point = {
	var x:Float;
	var y:Float;
	var ?z:Float;
	var ?dontChange:Bool;
}

enum PointOrSplineType {
	Point(p:Point);
	SplineType(s:String); // I have no idea
}

enum PortPos {
	CompassPoint(cp:CompassPoint);
	PortName(s:String);
	Both(s:String, cp:CompassPoint);
}

enum QuadType {
	Normal;
	Fast;
	None;
}

enum RankDir {
	Tb;
	Lr;
	Bt;
	Rl;
}

enum RankType {
	Same;
	Min;
	Source;
	Max;
	Sink;
}

typedef Rectangle = {
	llx:Float,
	lly:Float,
	urx:Float,
	ury:Float
}

enum Shape {
	Box;
	Polygon;
	Ellipse;
	Oval;
	Circle;
	Point;
	Egg;
	Triangle;
	Plaintext;
	Diamond;
	Trapezium;
	Parallelogram;
	House;
	Pentagon;
	Hexagon;
	Septagon;
	Octagon;
	Doublecircle;
	Doubleoctagon;
	Tripleoctagon;
	Invtriangle;
	Invtrapezium;
	Invhouse;
	Mdiamond;
	Msquare;
	Mcircle;
	Rect;
	Rectangle;
	Square;
	Star;
	None;
	Underline;
	Note;
	Tab;
	Folder;
	Box3d;
	Component;
	Promoter;
	Cds;
	Terminator;
	Utr;
	Primersite;
	Restrictionsite;
	Fivepoverhang;
	Threepoverhang;
	Noverhang;
	Assembly;
	Signature;
	Insulator;
	Ribosite;
	Rnastab;
	Proteasesite;
	Proteinstab;
	Rpromoter;
	Rarrow;
	Larrow;
	Lpromoter;
}

enum SmoothType {
	None;
	AvgDist;
	GraphDist;
	PowerDist;
	Rng;
	Spring;
	Triangle;
}

enum Style {
	Dashed;
	Dotted;
	Solid;
	Invis;
	Bold;
	Tapered;
	Filled;
	Striped;
	Wedged;
	Diagonals;
	Rounded;
}

enum Spline {
	None;
	Line;
	Polyline;
	Curved;
	Ortho;
	Spline;
}
