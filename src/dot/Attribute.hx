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

// Split

enum Attribute<T> {
	/**
		Indicates the preferred area for a node or empty cluster

		@see https://graphviz.org/docs/attrs/area/
	**/
	Area(v:Float):A2<N, C>;

	/**
		Style of arrowhead on the head node of an edge

		@see https://graphviz.org/docs/attrs/arrowhead/
	**/
	Arrowhead(v:ArrowType):A1<E>;

	/**
		Multiplicative scale factor for arrowheads

		@see https://graphviz.org/docs/attrs/arrowsize/
	**/
	Arrowsize(v:Float):A1<E>;

	/**
		Style of arrowhead on the tail node of an edge

		@see https://graphviz.org/docs/attrs/arrowtail/
	**/
	Arrowtail(v:ArrowType):A1<E>;

	/**
		A string in the [`xdot` format](/docs/attr-types/xdot/) specifying an arbitrary background

		@see https://graphviz.org/docs/attrs/background/
	**/
	_background(v:String):A1<G>;

	/**
		Bounding box of drawing in points

		@see https://graphviz.org/docs/attrs/bb/
	**/
	Bb(v:Rect):A1<G>;

	/**
		Whether to draw leaf nodes uniformly in a circle around the root node in sfdp.

		@see https://graphviz.org/docs/attrs/beautify/
	**/
	Beautify(v:Bool):A1<G>;

	/**
		Canvas background color

		@see https://graphviz.org/docs/attrs/bgcolor/
	**/
	Bgcolor(?v0:Color, ?v1:Array<Color>):A2<G, C>;

	/**
		Whether to center the drawing in the output canvas

		@see https://graphviz.org/docs/attrs/center/
	**/
	Center(v:Bool):A1<G>;

	/**
		Character encoding used when interpreting string input as a text label.

		@see https://graphviz.org/docs/attrs/charset/
	**/
	Charset(v:String):A1<G>;

	/**
		Classnames to attach to the node, edge, graph, or cluster's SVG element

		@see https://graphviz.org/docs/attrs/class/
	**/
	Class(v:String):All;

	/**
		Whether the subgraph is a cluster

		@see https://graphviz.org/docs/attrs/cluster/
	**/
	Cluster(v:Bool):A2<C, C>;

	/**
		Mode used for handling clusters

		@see https://graphviz.org/docs/attrs/clusterrank/
	**/
	Clusterrank(v:ClusterMode):A1<G>;

	/**
		Basic drawing color for graphics, not text

		@see https://graphviz.org/docs/attrs/color/
	**/
	Color(?v0:Color, ?v1:Array<Color>):A3<E, N, C>;

	/**
		"A color scheme namespace: the context for interpreting color names"

		@see https://graphviz.org/docs/attrs/colorscheme/
	**/
	Colorscheme(v:String):All;

	/**
		Comments are inserted into output

		@see https://graphviz.org/docs/attrs/comment/
	**/
	Comment(v:String):A3<E, N, G>;

	/**
		If true, allow edges between clusters

		@see https://graphviz.org/docs/attrs/compound/
	**/
	Compound(v:Bool):A1<G>;

	/**
		If true, use edge concentrators

		@see https://graphviz.org/docs/attrs/concentrate/
	**/
	Concentrate(v:Bool):A1<G>;

	/**
		If false, the edge is not used in ranking the nodes

		@see https://graphviz.org/docs/attrs/constraint/
	**/
	Constraint(v:Bool):A1<E>;

	/**
		Factor damping force motions.

		@see https://graphviz.org/docs/attrs/Damping/
	**/
	Damping(v:Float):A1<G>;

	/**
		Whether to connect the edge label to the edge with a line

		@see https://graphviz.org/docs/attrs/decorate/
	**/
	Decorate(v:Bool):A1<E>;

	/**
		The distance between nodes in separate connected components

		@see https://graphviz.org/docs/attrs/defaultdist/
	**/
	Defaultdist(v:Float):A1<G>;

	/**
		Set the number of dimensions used for the layout

		@see https://graphviz.org/docs/attrs/dim/
	**/
	Dim(v:Int):A1<G>;

	/**
		Set the number of dimensions used for rendering

		@see https://graphviz.org/docs/attrs/dimen/
	**/
	Dimen(v:Int):A1<G>;

	/**
		Edge type for drawing arrowheads

		@see https://graphviz.org/docs/attrs/dir/
	**/
	Dir(v:DirType):A1<E>;

	/**
		Whether to constrain most edges to point downwards

		@see https://graphviz.org/docs/attrs/diredgeconstraints/
	**/
	Diredgeconstraints(?v0:String, ?v1:Bool):A1<G>;

	/**
		Distortion factor for <code>[shape](/docs/attrs/shape)=[polygon](/doc/info/shapes.html#polygon)</code>

		@see https://graphviz.org/docs/attrs/distortion/
	**/
	Distortion(v:Float):A1<N>;

	/**
		Specifies the expected number of pixels per inch on a display device

		@see https://graphviz.org/docs/attrs/dpi/
	**/
	Dpi(v:Float):A1<G>;

	/**
		Synonym for [`edgeURL`](/docs/attrs/edgeURL)

		@see https://graphviz.org/docs/attrs/edgehref/
	**/
	Edgehref(v:String):A1<E>;

	/**
		Browser window to use for the [`edgeURL`](/docs/attrs/edgeURL/) link

		@see https://graphviz.org/docs/attrs/edgetarget/
	**/
	Edgetarget(v:String):A1<E>;

	/**
		Tooltip annotation attached to the non-label part of an edge

		@see https://graphviz.org/docs/attrs/edgetooltip/
	**/
	Edgetooltip(v:String):A1<E>;

	/**
		The link for the non-label parts of an edge

		@see https://graphviz.org/docs/attrs/edgeURL/
	**/
	EdgeURL(v:String):A1<E>;

	/**
		Terminating condition

		@see https://graphviz.org/docs/attrs/epsilon/
	**/
	Epsilon(v:Float):A1<G>;

	/**
		Margin used around polygons for purposes of spline edge routing

		@see https://graphviz.org/docs/attrs/esep/
	**/
	Esep(?v0:AddDouble, ?v1:AddPoint):A1<G>;

	/**
		Color used to fill the background of a node or cluster

		@see https://graphviz.org/docs/attrs/fillcolor/
	**/
	Fillcolor(?v0:Color, ?v1:Array<Color>):A3<N, E, C>;

	/**
		Whether to use the specified width and height attributes to choose node size (rather than sizing to fit the node contents)

		@see https://graphviz.org/docs/attrs/fixedsize/
	**/
	Fixedsize(?v0:Bool, ?v1:String):A1<N>;

	/**
		Color used for text

		@see https://graphviz.org/docs/attrs/fontcolor/
	**/
	Fontcolor(v:Color):All;

	/**
		Font used for text

		@see https://graphviz.org/docs/attrs/fontname/
	**/
	Fontname(v:String):All;

	/**
		Allows user control of how basic fontnames are represented in SVG output

		@see https://graphviz.org/docs/attrs/fontnames/
	**/
	Fontnames(v:String):A1<G>;

	/**
		Directory list used by [libgd](https://libgd.github.io/) to search for bitmap fonts

		@see https://graphviz.org/docs/attrs/fontpath/
	**/
	Fontpath(v:String):A1<G>;

	/**
		Font size, [in points](/doc/info/attrs.html#points), used for text

		@see https://graphviz.org/docs/attrs/fontsize/
	**/
	Fontsize(v:Float):All;

	/**
		Whether to force placement of all [`xlabels`](/docs/attrs/xlabel/), even if overlapping

		@see https://graphviz.org/docs/attrs/forcelabels/
	**/
	Forcelabels(v:Bool):A1<G>;

	/**
		If a gradient fill is being used, this determines the angle of the fill

		@see https://graphviz.org/docs/attrs/gradientangle/
	**/
	Gradientangle(v:Int):A3<N, C, G>;

	/**
		Name for a group of nodes, for bundling edges avoiding crossings.

		@see https://graphviz.org/docs/attrs/group/
	**/
	Group(v:String):A1<N>;

	/**
		If true, the head of an edge is clipped to the boundary of the head node

		@see https://graphviz.org/docs/attrs/headclip/
	**/
	Headclip(v:Bool):A1<E>;

	/**
		Synonym for [`headURL`](/docs/attrs/headURL)

		@see https://graphviz.org/docs/attrs/headhref/
	**/
	Headhref(v:String):A1<E>;

	/**
		Text label to be placed near head of edge

		@see https://graphviz.org/docs/attrs/headlabel/
	**/
	Headlabel(v:String):A1<E>;

	/**
		Indicates where on the head node to attach the head of the edge

		@see https://graphviz.org/docs/attrs/headport/
	**/
	Headport(v:PortPos):A1<E>;

	/**
		Browser window to use for the [`headURL`](/docs/attrs/headURL) link

		@see https://graphviz.org/docs/attrs/headtarget/
	**/
	Headtarget(v:String):A1<E>;

	/**
		Tooltip annotation attached to the head of an edge

		@see https://graphviz.org/docs/attrs/headtooltip/
	**/
	Headtooltip(v:String):A1<E>;

	/**
		If defined, `headURL` is output as part of the head label of the edge

		@see https://graphviz.org/docs/attrs/headURL/
	**/
	HeadURL(v:String):A1<E>;

	/**
		Center position of an edge's head label

		@see https://graphviz.org/docs/attrs/head_lp/
	**/
	Head_lp(v:Point):A1<E>;

	/**
		Height of node, in inches

		@see https://graphviz.org/docs/attrs/height/
	**/
	Height(v:Float):A1<N>;

	/**
		Synonym for [`URL`](/docs/attrs/URL)

		@see https://graphviz.org/docs/attrs/href/
	**/
	Href(v:String):All;

	/**
		Identifier for graph objects

		@see https://graphviz.org/docs/attrs/id/
	**/
	Id(v:String):All;

	/**
		Gives the name of a file containing an image to be displayed inside a node

		@see https://graphviz.org/docs/attrs/image/
	**/
	Image(v:String):A1<N>;

	/**
		A list of directories in which to look for image files

		@see https://graphviz.org/docs/attrs/imagepath/
	**/
	Imagepath(v:String):A1<G>;

	/**
		Controls how an image is positioned within its containing node

		@see https://graphviz.org/docs/attrs/imagepos/
	**/
	Imagepos(v:String):A1<N>;

	/**
		Controls how an image fills its containing node

		@see https://graphviz.org/docs/attrs/imagescale/
	**/
	Imagescale(?v0:ImageScale, ?v1:Bool):A1<N>;

	/**
		Scales the input [positions](/docs/attrs/pos/) to convert between length units

		@see https://graphviz.org/docs/attrs/inputscale/
	**/
	Inputscale(v:Float):A1<G>;

	/**
		Spring constant used in virtual physical model

		@see https://graphviz.org/docs/attrs/K/
	**/
	K(v:Float):A2<G, C>;

	/**
		Text label attached to objects

		@see https://graphviz.org/docs/attrs/label/
	**/
	Label(v:String):All;

	/**
		The angle (in degrees) in polar coordinates of the head & tail edge labels.

		@see https://graphviz.org/docs/attrs/labelangle/
	**/
	Labelangle(v:Float):A1<E>;

	/**
		"Scaling factor for the distance of [`headlabel`](/docs/attrs/headlabel/) / [`taillabel`](/docs/attrs/taillabel/) from the head / tail nodes."

		@see https://graphviz.org/docs/attrs/labeldistance/
	**/
	Labeldistance(v:Float):A1<E>;

	/**
		If true, allows edge labels to be less constrained in position

		@see https://graphviz.org/docs/attrs/labelfloat/
	**/
	Labelfloat(v:Bool):A1<E>;

	/**
		Color used for [`headlabel`](/docs/attrs/headlabel/) and [`taillabel`](/docs/attrs/taillabel/).

		@see https://graphviz.org/docs/attrs/labelfontcolor/
	**/
	Labelfontcolor(v:Color):A1<E>;

	/**
		Font for `headlabel` and `taillabel`

		@see https://graphviz.org/docs/attrs/labelfontname/
	**/
	Labelfontname(v:String):A1<E>;

	/**
		Font size of `headlabel` and `taillabel`

		@see https://graphviz.org/docs/attrs/labelfontsize/
	**/
	Labelfontsize(v:Float):A1<E>;

	/**
		Synonym for [`labelURL`](/docs/attrs/labelURL/)

		@see https://graphviz.org/docs/attrs/labelhref/
	**/
	Labelhref(v:String):A1<E>;

	/**
		Justification for graph & cluster labels

		@see https://graphviz.org/docs/attrs/labeljust/
	**/
	Labeljust(v:String):A2<G, C>;

	/**
		Vertical placement of labels for nodes, root graphs and clusters

		@see https://graphviz.org/docs/attrs/labelloc/
	**/
	Labelloc(v:String):A3<N, G, C>;

	/**
		Browser window to open [`labelURL`](/docs/attrs/labelURL/) links in

		@see https://graphviz.org/docs/attrs/labeltarget/
	**/
	Labeltarget(v:String):A1<E>;

	/**
		Tooltip annotation attached to label of an edge

		@see https://graphviz.org/docs/attrs/labeltooltip/
	**/
	Labeltooltip(v:String):A1<E>;

	/**
		If defined, `labelURL` is the link used for the label of an edge

		@see https://graphviz.org/docs/attrs/labelURL/
	**/
	LabelURL(v:String):A1<E>;

	/**
		Whether to treat a node whose name has the form `|edgelabel|*` as a special node representing an edge label.

		@see https://graphviz.org/docs/attrs/label_scheme/
	**/
	Label_scheme(v:Int):A1<G>;

	/**
		If true, the graph is rendered in landscape mode

		@see https://graphviz.org/docs/attrs/landscape/
	**/
	Landscape(v:Bool):A1<G>;

	/**
		Specifies layers in which the node, edge or cluster is present

		@see https://graphviz.org/docs/attrs/layer/
	**/
	Layer(v:String):A3<E, N, C>;

	/**
		The separator characters used to split attributes of type [`layerRange`](/docs/attr-types/layerRange/) into a list of ranges.

		@see https://graphviz.org/docs/attrs/layerlistsep/
	**/
	Layerlistsep(v:String):A1<G>;

	/**
		A linearly ordered list of layer names attached to the graph

		@see https://graphviz.org/docs/attrs/layers/
	**/
	Layers(v:Array<String>):A1<G>;

	/**
		Selects a list of layers to be emitted

		@see https://graphviz.org/docs/attrs/layerselect/
	**/
	Layerselect(v:String):A1<G>;

	/**
		The separator characters for splitting the [`layers`](/docs/attrs/layers/) attribute into a list of layer names.

		@see https://graphviz.org/docs/attrs/layersep/
	**/
	Layersep(v:String):A1<G>;

	/**
		Which [layout engine](/docs/layouts/) to use

		@see https://graphviz.org/docs/attrs/layout/
	**/
	Layout(v:String):A1<G>;

	/**
		Preferred edge length, in inches

		@see https://graphviz.org/docs/attrs/len/
	**/
	Len(v:Float):A1<E>;

	/**
		Number of levels allowed in the multilevel scheme

		@see https://graphviz.org/docs/attrs/levels/
	**/
	Levels(v:Int):A1<G>;

	/**
		strictness of neato level constraints

		@see https://graphviz.org/docs/attrs/levelsgap/
	**/
	Levelsgap(v:Float):A1<G>;

	/**
		Logical head of an edge

		@see https://graphviz.org/docs/attrs/lhead/
	**/
	Lhead(v:String):A1<E>;

	/**
		Height of graph or cluster label, in inches

		@see https://graphviz.org/docs/attrs/lheight/
	**/
	Lheight(v:Float):A2<G, C>;

	/**
		How long strings should get before overflowing to next line, for text output.

		@see https://graphviz.org/docs/attrs/linelength/
	**/
	Linelength(v:Int):A1<G>;

	/**
		Label center position

		@see https://graphviz.org/docs/attrs/lp/
	**/
	Lp(v:Point):A3<E, G, C>;

	/**
		Logical tail of an edge

		@see https://graphviz.org/docs/attrs/ltail/
	**/
	Ltail(v:String):A1<E>;

	/**
		Width of graph or cluster label, in inches

		@see https://graphviz.org/docs/attrs/lwidth/
	**/
	Lwidth(v:Float):A2<G, C>;

	/**
		For graphs, this sets x and y margins of canvas, in inches

		@see https://graphviz.org/docs/attrs/margin/
	**/
	Margin(?v0:Float, ?v1:Point):A3<N, C, G>;

	/**
		Sets the number of iterations used

		@see https://graphviz.org/docs/attrs/maxiter/
	**/
	Maxiter(v:Int):A1<G>;

	/**
		Scale factor for mincross (mc) edge crossing minimiser parameters

		@see https://graphviz.org/docs/attrs/mclimit/
	**/
	Mclimit(v:Float):A1<G>;

	/**
		Specifies the minimum separation between all nodes

		@see https://graphviz.org/docs/attrs/mindist/
	**/
	Mindist(v:Float):A1<G>;

	/**
		Minimum edge length (rank difference between head and tail)

		@see https://graphviz.org/docs/attrs/minlen/
	**/
	Minlen(v:Int):A1<E>;

	/**
		Technique for optimizing the layout

		@see https://graphviz.org/docs/attrs/mode/
	**/
	Mode(v:String):A1<G>;

	/**
		Specifies how the distance matrix is computed for the input graph

		@see https://graphviz.org/docs/attrs/model/
	**/
	Model(v:String):A1<G>;

	/**
		Whether to use a single global ranking, ignoring clusters

		@see https://graphviz.org/docs/attrs/newrank/
	**/
	Newrank(v:Bool):A1<G>;

	/**
		In `dot`, `nodesep` specifies the minimum space between two adjacent nodes in the same rank, in inches

		@see https://graphviz.org/docs/attrs/nodesep/
	**/
	Nodesep(v:Float):A1<G>;

	/**
		Whether to justify multiline text vs the previous text line (rather than the side of the container).

		@see https://graphviz.org/docs/attrs/nojustify/
	**/
	Nojustify(v:Bool):All;

	/**
		normalizes coordinates of final layout

		@see https://graphviz.org/docs/attrs/normalize/
	**/
	Normalize(?v0:Float, ?v1:Bool):A1<G>;

	/**
		Whether to avoid translating layout to the origin point

		@see https://graphviz.org/docs/attrs/notranslate/
	**/
	Notranslate(v:Bool):A1<G>;

	/**
		Sets number of iterations in network simplex applications

		@see https://graphviz.org/docs/attrs/nslimit/
	**/
	Nslimit(v:Float):A1<G>;

	/**
		Sets number of iterations in network simplex applications

		@see https://graphviz.org/docs/attrs/nslimit1/
	**/
	Nslimit1(v:Float):A1<G>;

	/**
		Whether to draw circo graphs around one circle.

		@see https://graphviz.org/docs/attrs/oneblock/
	**/
	Oneblock(v:Bool):A1<G>;

	/**
		Constrains the left-to-right ordering of node edges.

		@see https://graphviz.org/docs/attrs/ordering/
	**/
	Ordering(v:String):A2<G, N>;

	/**
		node shape rotation angle, or graph orientation

		@see https://graphviz.org/docs/attrs/orientation/
	**/
	Orientation(?v0:Float, ?v1:String):A2<N, G>;

	/**
		Specify order in which nodes and edges are drawn

		@see https://graphviz.org/docs/attrs/outputorder/
	**/
	Outputorder(v:OutputMode):A1<G>;

	/**
		Determines if and how node overlaps should be removed

		@see https://graphviz.org/docs/attrs/overlap/
	**/
	Overlap(?v0:String, ?v1:Bool):A1<G>;

	/**
		Scale layout by factor, to reduce node overlap.

		@see https://graphviz.org/docs/attrs/overlap_scaling/
	**/
	Overlap_scaling(v:Float):A1<G>;

	/**
		"Whether the overlap removal algorithm should perform a compression pass to reduce the size of the layout"

		@see https://graphviz.org/docs/attrs/overlap_shrink/
	**/
	Overlap_shrink(v:Bool):A1<G>;

	/**
		Whether each connected component of the graph should be laid out separately, and then the graphs packed together.

		@see https://graphviz.org/docs/attrs/pack/
	**/
	Pack(?v0:Bool, ?v1:Int):A1<G>;

	/**
		How connected components should be packed

		@see https://graphviz.org/docs/attrs/packmode/
	**/
	Packmode(v:PackMode):A1<G>;

	/**
		Inches to extend the drawing area around the minimal area needed to draw the graph

		@see https://graphviz.org/docs/attrs/pad/
	**/
	Pad(?v0:Float, ?v1:Point):A1<G>;

	/**
		Width and height of output pages, in inches

		@see https://graphviz.org/docs/attrs/page/
	**/
	Page(?v0:Float, ?v1:Point):A1<G>;

	/**
		The order in which pages are emitted

		@see https://graphviz.org/docs/attrs/pagedir/
	**/
	Pagedir(v:PageDir):A1<G>;

	/**
		Color used to draw the bounding box around a cluster

		@see https://graphviz.org/docs/attrs/pencolor/
	**/
	Pencolor(v:Color):A1<C>;

	/**
		Specifies the width of the pen, in points, used to draw lines and curves

		@see https://graphviz.org/docs/attrs/penwidth/
	**/
	Penwidth(v:Float):A3<C, N, E>;

	/**
		Set number of peripheries used in polygonal shapes and cluster boundaries

		@see https://graphviz.org/docs/attrs/peripheries/
	**/
	Peripheries(v:Int):A2<N, C>;

	/**
		Keeps the node at the node's given input position

		@see https://graphviz.org/docs/attrs/pin/
	**/
	Pin(v:Bool):A1<N>;

	/**
		Position of node, or spline control points

		@see https://graphviz.org/docs/attrs/pos/
	**/
	Pos(?v0:Point, ?v1:String):A2<E, N>;

	/**
		Quadtree scheme to use

		@see https://graphviz.org/docs/attrs/quadtree/
	**/
	Quadtree(?v0:QuadType, ?v1:Bool):A1<G>;

	/**
		If `quantum > 0.0`, node label dimensions will be rounded to integral multiples of the quantum

		@see https://graphviz.org/docs/attrs/quantum/
	**/
	Quantum(v:Float):A1<G>;

	/**
		Rank constraints on the nodes in a subgraph

		@see https://graphviz.org/docs/attrs/rank/
	**/
	Rank(v:RankType):A1<C>;

	/**
		Sets direction of graph layout

		@see https://graphviz.org/docs/attrs/rankdir/
	**/
	Rankdir(v:RankDir):A1<G>;

	/**
		Specifies separation between ranks

		@see https://graphviz.org/docs/attrs/ranksep/
	**/
	Ranksep(?v0:Float, ?v1:Array<Float>):A1<G>;

	/**
		Sets the aspect ratio (drawing height/drawing width) for the drawing

		@see https://graphviz.org/docs/attrs/ratio/
	**/
	Ratio(?v0:Float, ?v1:String):A1<G>;

	/**
		Rectangles for fields of records, [in points](/doc/info/attrs.html#points)

		@see https://graphviz.org/docs/attrs/rects/
	**/
	Rects(v:Rect):A1<N>;

	/**
		If true, force polygon to be regular.

		@see https://graphviz.org/docs/attrs/regular/
	**/
	Regular(v:Bool):A1<N>;

	/**
		If there are multiple clusters, whether to run edge crossing minimization a second time.

		@see https://graphviz.org/docs/attrs/remincross/
	**/
	Remincross(v:Bool):A1<G>;

	/**
		The power of the repulsive force used in an extended Fruchterman-Reingold

		@see https://graphviz.org/docs/attrs/repulsiveforce/
	**/
	Repulsiveforce(v:Float):A1<G>;

	/**
		Synonym for [`dpi`](/docs/attrs/dpi/).

		@see https://graphviz.org/docs/attrs/resolution/
	**/
	Resolution(v:Float):A1<G>;

	/**
		Specifies nodes to be used as the center of the layout

		@see https://graphviz.org/docs/attrs/root/
	**/
	Root(?v0:String, ?v1:Bool):A2<G, N>;

	/**
		If `rotate=90`, sets drawing orientation to landscape

		@see https://graphviz.org/docs/attrs/rotate/
	**/
	Rotate(v:Int):A1<G>;

	/**
		Rotates the final layout counter-clockwise by the specified number of degrees

		@see https://graphviz.org/docs/attrs/rotation/
	**/
	Rotation(v:Float):A1<G>;

	/**
		Edges with the same head and the same `samehead` value are aimed at the same point on the head

		@see https://graphviz.org/docs/attrs/samehead/
	**/
	Samehead(v:String):A1<E>;

	/**
		Edges with the same tail and the same `sametail` value are aimed at the same point on the tail.

		@see https://graphviz.org/docs/attrs/sametail/
	**/
	Sametail(v:String):A1<E>;

	/**
		Gives the number of points used for a circle/ellipse node

		@see https://graphviz.org/docs/attrs/samplepoints/
	**/
	Samplepoints(v:Int):A1<N>;

	/**
		Scales layout by the given factor after the initial layout

		@see https://graphviz.org/docs/attrs/scale/
	**/
	Scale(?v0:Float, ?v1:Point):A1<G>;

	/**
		During network simplex, the maximum number of edges with negative cut values to search when looking for an edge with minimum cut value.

		@see https://graphviz.org/docs/attrs/searchsize/
	**/
	Searchsize(v:Int):A1<G>;

	/**
		Margin to leave around nodes when removing node overlap

		@see https://graphviz.org/docs/attrs/sep/
	**/
	Sep(?v0:AddDouble, ?v1:AddPoint):A1<G>;

	/**
		Sets the [shape](/doc/info/shapes.html) of a node

		@see https://graphviz.org/docs/attrs/shape/
	**/
	Shape(v:Shape):A1<N>;

	/**
		A file containing user-supplied node content

		@see https://graphviz.org/docs/attrs/shapefile/
	**/
	Shapefile(v:String):A1<N>;

	/**
		Print guide boxes for debugging

		@see https://graphviz.org/docs/attrs/showboxes/
	**/
	Showboxes(v:Int):A3<E, N, G>;

	/**
		Number of sides when <code>[shape](/docs/attrs/shape)=polygon</code>

		@see https://graphviz.org/docs/attrs/sides/
	**/
	Sides(v:Int):A1<N>;

	/**
		Maximum width and height of drawing, in inches

		@see https://graphviz.org/docs/attrs/size/
	**/
	Size(?v0:Float, ?v1:Point):A1<G>;

	/**
		Skew factor for <code>[shape](/docs/attrs/shape)=polygon</code>

		@see https://graphviz.org/docs/attrs/skew/
	**/
	Skew(v:Float):A1<N>;

	/**
		Specifies a post-processing step used to smooth out an uneven distribution of nodes.

		@see https://graphviz.org/docs/attrs/smoothing/
	**/
	Smoothing(v:SmoothType):A1<G>;

	/**
		Sort order of graph components for ordering [`packmode`](/docs/attrs/packmode/) packing.

		@see https://graphviz.org/docs/attrs/sortv/
	**/
	Sortv(v:Int):A3<G, C, N>;

	/**
		Controls how, and if, edges are represented

		@see https://graphviz.org/docs/attrs/splines/
	**/
	Splines(?v0:Spline, ?v1:Bool):A1<G>;

	/**
		Parameter used to determine the initial layout of nodes

		@see https://graphviz.org/docs/attrs/start/
	**/
	Start(v:String):A1<G>;

	/**
		Set style information for components of the graph

		@see https://graphviz.org/docs/attrs/style/
	**/
	Style(v:Style):All;

	/**
		A URL or pathname specifying an XML style sheet, used in SVG output

		@see https://graphviz.org/docs/attrs/stylesheet/
	**/
	Stylesheet(v:String):A1<G>;

	/**
		If true, the tail of an edge is clipped to the boundary of the tail node

		@see https://graphviz.org/docs/attrs/tailclip/
	**/
	Tailclip(v:Bool):A1<E>;

	/**
		Synonym for [`tailURL`](/docs/attrs/tailURL/).

		@see https://graphviz.org/docs/attrs/tailhref/
	**/
	Tailhref(v:String):A1<E>;

	/**
		Text label to be placed near tail of edge

		@see https://graphviz.org/docs/attrs/taillabel/
	**/
	Taillabel(v:String):A1<E>;

	/**
		Indicates where on the tail node to attach the tail of the edge

		@see https://graphviz.org/docs/attrs/tailport/
	**/
	Tailport(v:PortPos):A1<E>;

	/**
		Browser window to use for the [`tailURL`](/docs/attrs/tailURL) link

		@see https://graphviz.org/docs/attrs/tailtarget/
	**/
	Tailtarget(v:String):A1<E>;

	/**
		Tooltip annotation attached to the tail of an edge

		@see https://graphviz.org/docs/attrs/tailtooltip/
	**/
	Tailtooltip(v:String):A1<E>;

	/**
		If defined, `tailURL` is output as part of the tail label of the edge

		@see https://graphviz.org/docs/attrs/tailURL/
	**/
	TailURL(v:String):A1<E>;

	/**
		Position of an edge's tail label, [in points](/doc/info/attrs.html#points).

		@see https://graphviz.org/docs/attrs/tail_lp/
	**/
	Tail_lp(v:Point):A1<E>;

	/**
		If the object has a [`URL`](/docs/attrs/URL/), this attribute determines which window of the browser is used for the URL.

		@see https://graphviz.org/docs/attrs/target/
	**/
	Target(?v0:String, ?v1:String):All;

	/**
		Which [rank](/docs/attrs/rank/) to move floating (loose) nodes to

		@see https://graphviz.org/docs/attrs/TBbalance/
	**/
	TBbalance(v:String):A1<G>;

	/**
		Tooltip (mouse hover text) attached to the node, edge, cluster, or graph

		@see https://graphviz.org/docs/attrs/tooltip/
	**/
	Tooltip(v:String):All;

	/**
		Whether internal bitmap rendering relies on a truecolor color model or uses

		@see https://graphviz.org/docs/attrs/truecolor/
	**/
	Truecolor(v:Bool):A1<G>;

	/**
		Hyperlinks incorporated into device-dependent output

		@see https://graphviz.org/docs/attrs/URL/
	**/
	URL(v:String):All;

	/**
		Sets the coordinates of the vertices of the node's polygon, in inches

		@see https://graphviz.org/docs/attrs/vertices/
	**/
	Vertices(v:Array<Point>):A1<N>;

	/**
		Clipping window on final drawing

		@see https://graphviz.org/docs/attrs/viewport/
	**/
	Viewport(v:String):A1<G>;

	/**
		Tuning margin of Voronoi technique

		@see https://graphviz.org/docs/attrs/voro_margin/
	**/
	Voro_margin(v:Float):A1<G>;

	/**
		Weight of edge

		@see https://graphviz.org/docs/attrs/weight/
	**/
	Weight(?v0:Int, ?v1:Float):A1<E>;

	/**
		Width of node, in inches

		@see https://graphviz.org/docs/attrs/width/
	**/
	Width(v:Float):A1<N>;

	/**
		Determines the version of `xdot` used in output

		@see https://graphviz.org/docs/attrs/xdotversion/
	**/
	Xdotversion(v:String):A1<G>;

	/**
		External label for a node or edge

		@see https://graphviz.org/docs/attrs/xlabel/
	**/
	Xlabel(v:String):A2<E, N>;

	/**
		Position of an exterior label, [in points](/doc/info/attrs.html#points)

		@see https://graphviz.org/docs/attrs/xlp/
	**/
	Xlp(v:Point):A2<N, E>;

	/**
		Z-coordinate value for 3D layouts and displays

		@see https://graphviz.org/docs/attrs/z/
	**/
	Z(v:Float):A1<N>;
}

// Split

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

enum ImageScale {
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

typedef Rect = {
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
