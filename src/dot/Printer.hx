package dot;

import dot.Attribute;

class Printer {
	static public function printAttribute<T>(attribute:Attribute<T>) {
		return switch (attribute) {
			case Area(f): 'area=$f';
			case ArrowHead(at): 'arrowhead=${printArrowType(at)}';
			case ArrowSize(f): 'arrowsize=$f';
			case ArrowTail(at): 'arrowtail=${printArrowType(at)}';
			case BB(rect): 'bb="${printRectangle(rect)}"';
			case BGColor(c): 'bgcolor=${printColor(c)}';
			case Center(b): 'center=$b';
			case Charset(s): 'charset="$s"';
			case ClusterRank(cm): 'clusterrank=${printClusterMode(cm)}';
			case Color(cl): 'color=${cl.map(printColor).join(":")}';
			case ColorScheme(s): 'colorscheme="$s"';
			case Comment(s): 'comment="$s"';
			case Compound(b): 'compound=$b';
			case Concentrate(b): 'concentrate=$b';
			case Constraint(b): 'constraint=$b';
			case Decorate(b): 'decorate=$b';
			case DefaultDist(f): 'defaultdist=$f';
			case Dim(i): 'dim=$i';
			case Dimen(i): 'dimen=$i';
			case Dir(dt): 'dir=${printDirType(dt)}';
			case DirEdgeConstraints(s): 'diredgeconstraints=${printBoolString(s)}';
			case Distortion(f): 'distortion=$f';
			case DPI(f): 'dpi=$f';
			case EdgeUrl(s): 'edgeurl="$s"';
			case EdgeHref(s): 'edgehref="$s';
			case EdgeTarget(s): 'edgetarget="$s"';
			case EdgeTooltip(s): 'edgetooltip="$s"';
			case Epsilon(f): 'epsilon=$f';
			case ESep(dop, add): 'esep=${add ? "+" : ""}${printDoubleOrPoint(dop)}';
			case FillColor(c): 'fillcolor=${printColor(c)}';
			case FixedSize(b): 'fixedsize=$b';
			case FontColor(c): 'fontcolor=${printColor(c)}';
			case FontName(s): 'fontname="$s"';
			case FontNames(s): 'fontnames="$s"';
			case FontPath(s): 'fontpath="$s';
			case FontSize(f): 'fontsize=$f';
			case ForceLabels(b): 'forcelabels=$b';
			case GradientAngle(i): 'gradientangle=$i';
			case Group(s): 'group="$s"';
			case HeadUrl(s): 'headurl="$s"';
			case HeadLp(p): 'head_lp=${printPoint(p)}';
			case HeadClip(b): 'headclip=$b';
			case HeadHref(s): 'headhref="$s"';
			case HeadLabel(s): 'headlabel="$s"';
			case HeadPort(pp): 'headport=${printPortPos(pp)}';
			case HeadTarget(s): 'headtarget="$s"';
			case HeadTooltip(s): 'headtooltip="$s"';
			case Height(f): 'height=$f';
			case Href(s): 'href="$s"';
			case Id(s): 'id="$s"';
			case Image(s): 'image="$s"';
			case ImagePath(s): 'imagepath="$s"';
			case ImageScale(ims): 'imagescale=${printImageScale(ims)}';
			case InputScale(f): 'inputscale=$f';
			case Label(s): 'label="$s"';
			case LabelUrl(s): 'labelurl="$s"';
			case LabelScheme(i): 'labelscheme=$i';
			case LabelAngle(f): 'labelangle=$f';
			case LabelDistance(f): 'labeldistance=$f';
			case LabelFloat(b): 'labelfloat=$b';
			case LabelFontColor(c): 'labelfontcolor=${printColor(c)}';
			case LabelFontName(s): 'labelfontname="$s"';
			case LabelFontSize(f): 'labelfontsize=$f';
			case LabelHref(s): 'labelhref="$s"';
			case LabelJust(s): 'labeljust="$s"';
			case LabelLoc(s): 'labelloc="$s"';
			case LabelTarget(s): 'labeltarget="$s"';
			case LabelTooltip(s): 'labeltooltip="$s"';
			case Landscape(b): 'landscape=$b';
			case Layer(s): 'layer="$s"';
			case LayerListSep(s): 'layerlistsep="$s"';
			case Layers(s): 'layers="$s"';
			case LayerSelect(s): 'layerselect="$s"';
			case LayerSep(s): 'layersep="$s"';
			case Layout(s): 'layout="$s"';
			case Len(f): 'len=$f';
			case Levels(i): 'levels=$i';
			case LevelsGap(f): 'levelsgap=$f';
			case LHead(s): 'lhead="$s"';
			case LHeight(f): 'lheight=$f';
			case Lp(p): 'lp=${printPoint(p)}';
			case LTail(s): 'ltail="$s"';
			case LWidth(f): 'lwidth=$f';
			case Margin(dop): 'margin=${printDoubleOrPoint(dop)}';
			case MaxIter(i): 'maxiter=$i';
			case McLimit(f): 'mclimit=$f';
			case MinDist(f): 'mindist=$f';
			case MinLen(i): 'minlen=$i';
			case Mode(s): 'mode="$s"';
			case Model(s): 'model="$s"';
			case Newrank(b): 'newrank=$b';
			case NodeSep(f): 'nodesep=$f';
			case NoJustify(b): 'nojustify=$b';
			case Normalize(f): 'normalize=$f';
			case NsLimit(f): 'nslimit=$f';
			case Ordering(s): 'ordering="$s"';
			case Orientation(dos): 'orientation=${printDoubleOrString(dos)}';
			case OutputOrder(om): 'outputorder=${printOutputMode(om)}';
			case Overlap(s): 'overlap=${printBoolString(s)}';
			case OverlapScaling(f): 'overlapscaling=$f';
			case OverlapShrink(b): 'overlapshrink=$b';
			case Pack(boi): 'pack=${printBoolOrInt(boi)}';
			case Packmode(pm): 'packmode=${printPackMode(pm)}';
			case Pad(dop): 'pad=${printDoubleOrPoint(dop)}';
			case Page(dop): 'page=${printDoubleOrPoint(dop)}';
			case PageDir(pdir): 'pagedir=${printPageDir(pdir)}';
			case PenColor(c): 'pencolor=${printColor(c)}';
			case PenWidth(f): 'penwidth=$f';
			case Peripheries(i): 'peripheries=$i';
			case Pin(b): 'pin=$b';
			case Pos(post): 'pos=${printPointOrSplineType(post)}';
			case Quadtree(boq): 'quadtree=${printBoolOrQuadType(boq)}';
			case Quantum(f): 'quantum=$f';
			case Rank(rt): 'rank=${printRankType(rt)}';
			case RankDir(rd): 'rankdir="${printRankDir(rd)}"';
			case RankSep(fl): 'ranksep=${printDoubleList(fl)}';
			case Ratio(dos): 'ratio=${printDoubleOrString(dos)}';
			case Rects(rect): 'rects=${printRectangle(rect)}';
			case Regular(b): 'regular=$b';
			case Remincross(b): 'remincross=$b';
			case RepulsiveForce(f): 'repulsiveforce=$f';
			case Resolution(f): 'resolution=$f';
			case Root(s): 'root=${printBoolString(s)}';
			case Rotate(i): 'rotate=$i';
			case Rotation(f): 'rotation=$f';
			case SameHead(s): 'samehead="$s"';
			case SameTail(s): 'sametail="$s"';
			case SamplePoint(o): 'samplepoint=$o';
			case Scale(dop): 'scale=${printDoubleOrPoint(dop)}';
			case SearchSize(i): 'searchsize=$i';
			case Sep(dop, add): 'sep=${add ? "+" : ""}${printDoubleOrPoint(dop)}';
			case Shape(sh): 'shape=${printShape(sh)}';
			case Shapefile(s): 'shapefile="$s"';
			case Showboxes(i): 'showboxes=$i';
			case Sides(i): 'sides=$i';
			case Size(dop): 'size=${printDoubleOrPoint(dop)}';
			case Skew(f): 'skew=$f';
			case Smoothing(st): 'smoothing=${printSmoothType(st)}';
			case Sortv(i): 'sortv=$i';
			case Splines(var spline): 'splines=${printSpline(spline)}';
			case Start(s): 'start="$s"';
			case Style(st): 'style=${printStyle(st)}';
			case Stylesheet(s): 'stylesheet="$s"';
			case TailUrl(s): 'tailurl="$s"';
			case TailLp(p): 'tail_lp=${printPoint(p)}';
			case TailClip(b): 'tailclip=$b';
			case TailHref(s): 'tailhref="$s"';
			case TailLabel(s): 'taillabel="$s"';
			case TailPort(pp): 'tailport=${printPortPos(pp)}';
			case TailTarget(s): 'tailtarget="$s"';
			case TailTooltip(s): 'tailtooltip="$s"';
			case Target(s): 'target="$s"';
			case Tooltip(s): 'tooltip="$s"';
			case Truecolor(b): 'truecolor=$b';
			case Vertices(pl): 'vertices=${pl.map(printPoint).join(" ")}';
			case Viewport(s): 'viewport="$s"';
			case VoroMargin(f): 'voro_margin=$f';
			case Weight(f): 'weight=$f';
			case Width(f): 'width=$f';
			case XDotVersion(s): 'xdotversion="$s"';
			case XLabel(s): 'xlabel="$s"';
			case XLp(p): 'xlp=${printPoint(p)}';
			case Z(f): 'z=$f';
		};
	}

	static public function printAttributes<T>(attributes:Array<Attribute<T>>) {
		if (attributes.length > 0) {
			return "[" + attributes.map(printAttribute).join(", ") + "]";
		} else {
			return "";
		}
	}

	static public function printAddDouble(ad:AddDouble) {
		return '${(ad.add ? "+" : "")}${ad.f}';
	}

	static public function printAddPoint(ad:AddPoint) {
		return '${(ad.add ? "+" : "")}${printPoint(ad.point)}';
	}

	static public function printArrowType(at:ArrowType) {
		return switch (at) {
			case Normal: "normal";
			case Dot: "dot";
			case ODot: "odot";
			case None: "none";
			case Empty: "empty";
			case Diamond: "diamond";
			case EDiamond: "ediamond";
			case Box: "box";
			case Open: "open";
			case Vee: "vee";
			case Inv: "inv";
			case InvDot: "invdot";
			case InvODot: "invodot";
			case Tee: "tee";
			case InvEmpty: "invempty";
			case ODiamond: "odiamond";
			case Crow: "crow";
			case OBox: "obox";
			case HalfOpen: "halfopen";
			case Circle: "circle";
		}
	}

	static public function printBoolOrInt(boi:BoolOrInt) {
		return switch (boi) {
			case Bool(b): '$b';
			case Int(i): '$i';
		}
	}

	static public function printBoolOrQuadType(boq:BoolOrQuadType) {
		return switch (boq) {
			case Bool(b): '$b';
			case QuadType(qt): printQuadType(qt);
		}
	}

	static function printBoolString(s:String) {
		return switch (s) {
			case "true": 'true';
			case "false": 'false';
			case _: '"$s"';
		}
	}

	static public function printClusterMode(cm:ClusterMode) {
		return switch (cm) {
			case Local: "local";
			case Global: "global";
			case None: "none";
		}
	}

	static public function printColor(c:Color) {
		return switch (c) {
			case Aliceblue: "aliceblue";
			case Antiquewhite: "antiquewhite";
			case Antiquewhite1: "antiquewhite1";
			case Antiquewhite2: "antiquewhite2";
			case Antiquewhite3: "antiquewhite3";
			case Antiquewhite4: "antiquewhite4";
			case Aquamarine: "aquamarine";
			case Aquamarine1: "aquamarine1";
			case Aquamarine2: "aquamarine2";
			case Aquamarine3: "aquamarine3";
			case Aquamarine4: "aquamarine4";
			case Azure: "azure";
			case Azure1: "azure1";
			case Azure2: "azure2";
			case Azure3: "azure3";
			case Azure4: "azure4";
			case Beige: "beige";
			case Bisque: "bisque";
			case Bisque1: "bisque1";
			case Bisque2: "bisque2";
			case Bisque3: "bisque3";
			case Bisque4: "bisque4";
			case Black: "black";
			case Blanchedalmond: "blanchedalmond";
			case Blue: "blue";
			case Blue1: "blue1";
			case Blue2: "blue2";
			case Blue3: "blue3";
			case Blue4: "blue4";
			case Blueviolet: "blueviolet";
			case Brown: "brown";
			case Brown1: "brown1";
			case Brown2: "brown2";
			case Brown3: "brown3";
			case Brown4: "brown4";
			case Burlywood: "burlywood";
			case Burlywood1: "burlywood1";
			case Burlywood2: "burlywood2";
			case Burlywood3: "burlywood3";
			case Burlywood4: "burlywood4";
			case Cadetblue: "cadetblue";
			case Cadetblue1: "cadetblue1";
			case Cadetblue2: "cadetblue2";
			case Cadetblue3: "cadetblue3";
			case Cadetblue4: "cadetblue4";
			case Chartreuse: "chartreuse";
			case Chartreuse1: "chartreuse1";
			case Chartreuse2: "chartreuse2";
			case Chartreuse3: "chartreuse3";
			case Chartreuse4: "chartreuse4";
			case Chocolate: "chocolate";
			case Chocolate1: "chocolate1";
			case Chocolate2: "chocolate2";
			case Chocolate3: "chocolate3";
			case Chocolate4: "chocolate4";
			case Coral: "coral";
			case Coral1: "coral1";
			case Coral2: "coral2";
			case Coral3: "coral3";
			case Coral4: "coral4";
			case Cornflowerblue: "cornflowerblue";
			case Cornsilk: "cornsilk";
			case Cornsilk1: "cornsilk1";
			case Cornsilk2: "cornsilk2";
			case Cornsilk3: "cornsilk3";
			case Cornsilk4: "cornsilk4";
			case Crimson: "crimson";
			case Cyan: "cyan";
			case Cyan1: "cyan1";
			case Cyan2: "cyan2";
			case Cyan3: "cyan3";
			case Cyan4: "cyan4";
			case Darkgoldenrod: "darkgoldenrod";
			case Darkgoldenrod1: "darkgoldenrod1";
			case Darkgoldenrod2: "darkgoldenrod2";
			case Darkgoldenrod3: "darkgoldenrod3";
			case Darkgoldenrod4: "darkgoldenrod4";
			case Darkgreen: "darkgreen";
			case Darkkhaki: "darkkhaki";
			case Darkolivegreen: "darkolivegreen";
			case Darkolivegreen1: "darkolivegreen1";
			case Darkolivegreen2: "darkolivegreen2";
			case Darkolivegreen3: "darkolivegreen3";
			case Darkolivegreen4: "darkolivegreen4";
			case Darkorange: "darkorange";
			case Darkorange1: "darkorange1";
			case Darkorange2: "darkorange2";
			case Darkorange3: "darkorange3";
			case Darkorange4: "darkorange4";
			case Darkorchid: "darkorchid";
			case Darkorchid1: "darkorchid1";
			case Darkorchid2: "darkorchid2";
			case Darkorchid3: "darkorchid3";
			case Darkorchid4: "darkorchid4";
			case Darksalmon: "darksalmon";
			case Darkseagreen: "darkseagreen";
			case Darkseagreen1: "darkseagreen1";
			case Darkseagreen2: "darkseagreen2";
			case Darkseagreen3: "darkseagreen3";
			case Darkseagreen4: "darkseagreen4";
			case Darkslateblue: "darkslateblue";
			case Darkslategray: "darkslategray";
			case Darkslategray1: "darkslategray1";
			case Darkslategray2: "darkslategray2";
			case Darkslategray3: "darkslategray3";
			case Darkslategray4: "darkslategray4";
			case Darkslategrey: "darkslategrey";
			case Darkturquoise: "darkturquoise";
			case Darkviolet: "darkviolet";
			case Deeppink: "deeppink";
			case Deeppink1: "deeppink1";
			case Deeppink2: "deeppink2";
			case Deeppink3: "deeppink3";
			case Deeppink4: "deeppink4";
			case Deepskyblue: "deepskyblue";
			case Deepskyblue1: "deepskyblue1";
			case Deepskyblue2: "deepskyblue2";
			case Deepskyblue3: "deepskyblue3";
			case Deepskyblue4: "deepskyblue4";
			case Dimgray: "dimgray";
			case Dimgrey: "dimgrey";
			case Dodgerblue: "dodgerblue";
			case Dodgerblue1: "dodgerblue1";
			case Dodgerblue2: "dodgerblue2";
			case Dodgerblue3: "dodgerblue3";
			case Dodgerblue4: "dodgerblue4";
			case Firebrick: "firebrick";
			case Firebrick1: "firebrick1";
			case Firebrick2: "firebrick2";
			case Firebrick3: "firebrick3";
			case Firebrick4: "firebrick4";
			case Floralwhite: "floralwhite";
			case Forestgreen: "forestgreen";
			case Gainsboro: "gainsboro";
			case Ghostwhite: "ghostwhite";
			case Gold: "gold";
			case Gold1: "gold1";
			case Gold2: "gold2";
			case Gold3: "gold3";
			case Gold4: "gold4";
			case Goldenrod: "goldenrod";
			case Goldenrod1: "goldenrod1";
			case Goldenrod2: "goldenrod2";
			case Goldenrod3: "goldenrod3";
			case Goldenrod4: "goldenrod4";
			case Gray: "gray";
			case Gray0: "gray0";
			case Gray1: "gray1";
			case Gray10: "gray10";
			case Gray100: "gray100";
			case Gray11: "gray11";
			case Gray12: "gray12";
			case Gray13: "gray13";
			case Gray14: "gray14";
			case Gray15: "gray15";
			case Gray16: "gray16";
			case Gray17: "gray17";
			case Gray18: "gray18";
			case Gray19: "gray19";
			case Gray2: "gray2";
			case Gray20: "gray20";
			case Gray21: "gray21";
			case Gray22: "gray22";
			case Gray23: "gray23";
			case Gray24: "gray24";
			case Gray25: "gray25";
			case Gray26: "gray26";
			case Gray27: "gray27";
			case Gray28: "gray28";
			case Gray29: "gray29";
			case Gray3: "gray3";
			case Gray30: "gray30";
			case Gray31: "gray31";
			case Gray32: "gray32";
			case Gray33: "gray33";
			case Gray34: "gray34";
			case Gray35: "gray35";
			case Gray36: "gray36";
			case Gray37: "gray37";
			case Gray38: "gray38";
			case Gray39: "gray39";
			case Gray4: "gray4";
			case Gray40: "gray40";
			case Gray41: "gray41";
			case Gray42: "gray42";
			case Gray43: "gray43";
			case Gray44: "gray44";
			case Gray45: "gray45";
			case Gray46: "gray46";
			case Gray47: "gray47";
			case Gray48: "gray48";
			case Gray49: "gray49";
			case Gray5: "gray5";
			case Gray50: "gray50";
			case Gray51: "gray51";
			case Gray52: "gray52";
			case Gray53: "gray53";
			case Gray54: "gray54";
			case Gray55: "gray55";
			case Gray56: "gray56";
			case Gray57: "gray57";
			case Gray58: "gray58";
			case Gray59: "gray59";
			case Gray6: "gray6";
			case Gray60: "gray60";
			case Gray61: "gray61";
			case Gray62: "gray62";
			case Gray63: "gray63";
			case Gray64: "gray64";
			case Gray65: "gray65";
			case Gray66: "gray66";
			case Gray67: "gray67";
			case Gray68: "gray68";
			case Gray69: "gray69";
			case Gray7: "gray7";
			case Gray70: "gray70";
			case Gray71: "gray71";
			case Gray72: "gray72";
			case Gray73: "gray73";
			case Gray74: "gray74";
			case Gray75: "gray75";
			case Gray76: "gray76";
			case Gray77: "gray77";
			case Gray78: "gray78";
			case Gray79: "gray79";
			case Gray8: "gray8";
			case Gray80: "gray80";
			case Gray81: "gray81";
			case Gray82: "gray82";
			case Gray83: "gray83";
			case Gray84: "gray84";
			case Gray85: "gray85";
			case Gray86: "gray86";
			case Gray87: "gray87";
			case Gray88: "gray88";
			case Gray89: "gray89";
			case Gray9: "gray9";
			case Gray90: "gray90";
			case Gray91: "gray91";
			case Gray92: "gray92";
			case Gray93: "gray93";
			case Gray94: "gray94";
			case Gray95: "gray95";
			case Gray96: "gray96";
			case Gray97: "gray97";
			case Gray98: "gray98";
			case Gray99: "gray99";
			case Green: "green";
			case Green1: "green1";
			case Green2: "green2";
			case Green3: "green3";
			case Green4: "green4";
			case Greenyellow: "greenyellow";
			case Grey: "grey";
			case Grey0: "grey0";
			case Grey1: "grey1";
			case Grey10: "grey10";
			case Grey100: "grey100";
			case Grey11: "grey11";
			case Grey12: "grey12";
			case Grey13: "grey13";
			case Grey14: "grey14";
			case Grey15: "grey15";
			case Grey16: "grey16";
			case Grey17: "grey17";
			case Grey18: "grey18";
			case Grey19: "grey19";
			case Grey2: "grey2";
			case Grey20: "grey20";
			case Grey21: "grey21";
			case Grey22: "grey22";
			case Grey23: "grey23";
			case Grey24: "grey24";
			case Grey25: "grey25";
			case Grey26: "grey26";
			case Grey27: "grey27";
			case Grey28: "grey28";
			case Grey29: "grey29";
			case Grey3: "grey3";
			case Grey30: "grey30";
			case Grey31: "grey31";
			case Grey32: "grey32";
			case Grey33: "grey33";
			case Grey34: "grey34";
			case Grey35: "grey35";
			case Grey36: "grey36";
			case Grey37: "grey37";
			case Grey38: "grey38";
			case Grey39: "grey39";
			case Grey4: "grey4";
			case Grey40: "grey40";
			case Grey41: "grey41";
			case Grey42: "grey42";
			case Grey43: "grey43";
			case Grey44: "grey44";
			case Grey45: "grey45";
			case Grey46: "grey46";
			case Grey47: "grey47";
			case Grey48: "grey48";
			case Grey49: "grey49";
			case Grey5: "grey5";
			case Grey50: "grey50";
			case Grey51: "grey51";
			case Grey52: "grey52";
			case Grey53: "grey53";
			case Grey54: "grey54";
			case Grey55: "grey55";
			case Grey56: "grey56";
			case Grey57: "grey57";
			case Grey58: "grey58";
			case Grey59: "grey59";
			case Grey6: "grey6";
			case Grey60: "grey60";
			case Grey61: "grey61";
			case Grey62: "grey62";
			case Grey63: "grey63";
			case Grey64: "grey64";
			case Grey65: "grey65";
			case Grey66: "grey66";
			case Grey67: "grey67";
			case Grey68: "grey68";
			case Grey69: "grey69";
			case Grey7: "grey7";
			case Grey70: "grey70";
			case Grey71: "grey71";
			case Grey72: "grey72";
			case Grey73: "grey73";
			case Grey74: "grey74";
			case Grey75: "grey75";
			case Grey76: "grey76";
			case Grey77: "grey77";
			case Grey78: "grey78";
			case Grey79: "grey79";
			case Grey8: "grey8";
			case Grey80: "grey80";
			case Grey81: "grey81";
			case Grey82: "grey82";
			case Grey83: "grey83";
			case Grey84: "grey84";
			case Grey85: "grey85";
			case Grey86: "grey86";
			case Grey87: "grey87";
			case Grey88: "grey88";
			case Grey89: "grey89";
			case Grey9: "grey9";
			case Grey90: "grey90";
			case Grey91: "grey91";
			case Grey92: "grey92";
			case Grey93: "grey93";
			case Grey94: "grey94";
			case Grey95: "grey95";
			case Grey96: "grey96";
			case Grey97: "grey97";
			case Grey98: "grey98";
			case Grey99: "grey99";
			case Honeydew: "honeydew";
			case Honeydew1: "honeydew1";
			case Honeydew2: "honeydew2";
			case Honeydew3: "honeydew3";
			case Honeydew4: "honeydew4";
			case Hotpink: "hotpink";
			case Hotpink1: "hotpink1";
			case Hotpink2: "hotpink2";
			case Hotpink3: "hotpink3";
			case Hotpink4: "hotpink4";
			case Indianred: "indianred";
			case Indianred1: "indianred1";
			case Indianred2: "indianred2";
			case Indianred3: "indianred3";
			case Indianred4: "indianred4";
			case Indigo: "indigo";
			case Invis: "invis";
			case Ivory: "ivory";
			case Ivory1: "ivory1";
			case Ivory2: "ivory2";
			case Ivory3: "ivory3";
			case Ivory4: "ivory4";
			case Khaki: "khaki";
			case Khaki1: "khaki1";
			case Khaki2: "khaki2";
			case Khaki3: "khaki3";
			case Khaki4: "khaki4";
			case Lavender: "lavender";
			case Lavenderblush: "lavenderblush";
			case Lavenderblush1: "lavenderblush1";
			case Lavenderblush2: "lavenderblush2";
			case Lavenderblush3: "lavenderblush3";
			case Lavenderblush4: "lavenderblush4";
			case Lawngreen: "lawngreen";
			case Lemonchiffon: "lemonchiffon";
			case Lemonchiffon1: "lemonchiffon1";
			case Lemonchiffon2: "lemonchiffon2";
			case Lemonchiffon3: "lemonchiffon3";
			case Lemonchiffon4: "lemonchiffon4";
			case Lightblue: "lightblue";
			case Lightblue1: "lightblue1";
			case Lightblue2: "lightblue2";
			case Lightblue3: "lightblue3";
			case Lightblue4: "lightblue4";
			case Lightcoral: "lightcoral";
			case Lightcyan: "lightcyan";
			case Lightcyan1: "lightcyan1";
			case Lightcyan2: "lightcyan2";
			case Lightcyan3: "lightcyan3";
			case Lightcyan4: "lightcyan4";
			case Lightgoldenrod: "lightgoldenrod";
			case Lightgoldenrod1: "lightgoldenrod1";
			case Lightgoldenrod2: "lightgoldenrod2";
			case Lightgoldenrod3: "lightgoldenrod3";
			case Lightgoldenrod4: "lightgoldenrod4";
			case Lightgoldenrodyellow: "lightgoldenrodyellow";
			case Lightgray: "lightgray";
			case Lightgrey: "lightgrey";
			case Lightpink: "lightpink";
			case Lightpink1: "lightpink1";
			case Lightpink2: "lightpink2";
			case Lightpink3: "lightpink3";
			case Lightpink4: "lightpink4";
			case Lightsalmon: "lightsalmon";
			case Lightsalmon1: "lightsalmon1";
			case Lightsalmon2: "lightsalmon2";
			case Lightsalmon3: "lightsalmon3";
			case Lightsalmon4: "lightsalmon4";
			case Lightseagreen: "lightseagreen";
			case Lightskyblue: "lightskyblue";
			case Lightskyblue1: "lightskyblue1";
			case Lightskyblue2: "lightskyblue2";
			case Lightskyblue3: "lightskyblue3";
			case Lightskyblue4: "lightskyblue4";
			case Lightslateblue: "lightslateblue";
			case Lightslategray: "lightslategray";
			case Lightslategrey: "lightslategrey";
			case Lightsteelblue: "lightsteelblue";
			case Lightsteelblue1: "lightsteelblue1";
			case Lightsteelblue2: "lightsteelblue2";
			case Lightsteelblue3: "lightsteelblue3";
			case Lightsteelblue4: "lightsteelblue4";
			case Lightyellow: "lightyellow";
			case Lightyellow1: "lightyellow1";
			case Lightyellow2: "lightyellow2";
			case Lightyellow3: "lightyellow3";
			case Lightyellow4: "lightyellow4";
			case Limegreen: "limegreen";
			case Linen: "linen";
			case Magenta: "magenta";
			case Magenta1: "magenta1";
			case Magenta2: "magenta2";
			case Magenta3: "magenta3";
			case Magenta4: "magenta4";
			case Maroon: "maroon";
			case Maroon1: "maroon1";
			case Maroon2: "maroon2";
			case Maroon3: "maroon3";
			case Maroon4: "maroon4";
			case Mediumaquamarine: "mediumaquamarine";
			case Mediumblue: "mediumblue";
			case Mediumorchid: "mediumorchid";
			case Mediumorchid1: "mediumorchid1";
			case Mediumorchid2: "mediumorchid2";
			case Mediumorchid3: "mediumorchid3";
			case Mediumorchid4: "mediumorchid4";
			case Mediumpurple: "mediumpurple";
			case Mediumpurple1: "mediumpurple1";
			case Mediumpurple2: "mediumpurple2";
			case Mediumpurple3: "mediumpurple3";
			case Mediumpurple4: "mediumpurple4";
			case Mediumseagreen: "mediumseagreen";
			case Mediumslateblue: "mediumslateblue";
			case Mediumspringgreen: "mediumspringgreen";
			case Mediumturquoise: "mediumturquoise";
			case Mediumvioletred: "mediumvioletred";
			case Midnightblue: "midnightblue";
			case Mintcream: "mintcream";
			case Mistyrose: "mistyrose";
			case Mistyrose1: "mistyrose1";
			case Mistyrose2: "mistyrose2";
			case Mistyrose3: "mistyrose3";
			case Mistyrose4: "mistyrose4";
			case Moccasin: "moccasin";
			case Navajowhite: "navajowhite";
			case Navajowhite1: "navajowhite1";
			case Navajowhite2: "navajowhite2";
			case Navajowhite3: "navajowhite3";
			case Navajowhite4: "navajowhite4";
			case Navy: "navy";
			case Navyblue: "navyblue";
			case None: "none";
			case Oldlace: "oldlace";
			case Olivedrab: "olivedrab";
			case Olivedrab1: "olivedrab1";
			case Olivedrab2: "olivedrab2";
			case Olivedrab3: "olivedrab3";
			case Olivedrab4: "olivedrab4";
			case Orange: "orange";
			case Orange1: "orange1";
			case Orange2: "orange2";
			case Orange3: "orange3";
			case Orange4: "orange4";
			case Orangered: "orangered";
			case Orangered1: "orangered1";
			case Orangered2: "orangered2";
			case Orangered3: "orangered3";
			case Orangered4: "orangered4";
			case Orchid: "orchid";
			case Orchid1: "orchid1";
			case Orchid2: "orchid2";
			case Orchid3: "orchid3";
			case Orchid4: "orchid4";
			case Palegoldenrod: "palegoldenrod";
			case Palegreen: "palegreen";
			case Palegreen1: "palegreen1";
			case Palegreen2: "palegreen2";
			case Palegreen3: "palegreen3";
			case Palegreen4: "palegreen4";
			case Paleturquoise: "paleturquoise";
			case Paleturquoise1: "paleturquoise1";
			case Paleturquoise2: "paleturquoise2";
			case Paleturquoise3: "paleturquoise3";
			case Paleturquoise4: "paleturquoise4";
			case Palevioletred: "palevioletred";
			case Palevioletred1: "palevioletred1";
			case Palevioletred2: "palevioletred2";
			case Palevioletred3: "palevioletred3";
			case Palevioletred4: "palevioletred4";
			case Papayawhip: "papayawhip";
			case Peachpuff: "peachpuff";
			case Peachpuff1: "peachpuff1";
			case Peachpuff2: "peachpuff2";
			case Peachpuff3: "peachpuff3";
			case Peachpuff4: "peachpuff4";
			case Peru: "peru";
			case Pink: "pink";
			case Pink1: "pink1";
			case Pink2: "pink2";
			case Pink3: "pink3";
			case Pink4: "pink4";
			case Plum: "plum";
			case Plum1: "plum1";
			case Plum2: "plum2";
			case Plum3: "plum3";
			case Plum4: "plum4";
			case Powderblue: "powderblue";
			case Purple: "purple";
			case Purple1: "purple1";
			case Purple2: "purple2";
			case Purple3: "purple3";
			case Purple4: "purple4";
			case Red: "red";
			case Red1: "red1";
			case Red2: "red2";
			case Red3: "red3";
			case Red4: "red4";
			case Rosybrown: "rosybrown";
			case Rosybrown1: "rosybrown1";
			case Rosybrown2: "rosybrown2";
			case Rosybrown3: "rosybrown3";
			case Rosybrown4: "rosybrown4";
			case Royalblue: "royalblue";
			case Royalblue1: "royalblue1";
			case Royalblue2: "royalblue2";
			case Royalblue3: "royalblue3";
			case Royalblue4: "royalblue4";
			case Saddlebrown: "saddlebrown";
			case Salmon: "salmon";
			case Salmon1: "salmon1";
			case Salmon2: "salmon2";
			case Salmon3: "salmon3";
			case Salmon4: "salmon4";
			case Sandybrown: "sandybrown";
			case Seagreen: "seagreen";
			case Seagreen1: "seagreen1";
			case Seagreen2: "seagreen2";
			case Seagreen3: "seagreen3";
			case Seagreen4: "seagreen4";
			case Seashell: "seashell";
			case Seashell1: "seashell1";
			case Seashell2: "seashell2";
			case Seashell3: "seashell3";
			case Seashell4: "seashell4";
			case Sienna: "sienna";
			case Sienna1: "sienna1";
			case Sienna2: "sienna2";
			case Sienna3: "sienna3";
			case Sienna4: "sienna4";
			case Skyblue: "skyblue";
			case Skyblue1: "skyblue1";
			case Skyblue2: "skyblue2";
			case Skyblue3: "skyblue3";
			case Skyblue4: "skyblue4";
			case Slateblue: "slateblue";
			case Slateblue1: "slateblue1";
			case Slateblue2: "slateblue2";
			case Slateblue3: "slateblue3";
			case Slateblue4: "slateblue4";
			case Slategray: "slategray";
			case Slategray1: "slategray1";
			case Slategray2: "slategray2";
			case Slategray3: "slategray3";
			case Slategray4: "slategray4";
			case Slategrey: "slategrey";
			case Snow: "snow";
			case Snow1: "snow1";
			case Snow2: "snow2";
			case Snow3: "snow3";
			case Snow4: "snow4";
			case Springgreen: "springgreen";
			case Springgreen1: "springgreen1";
			case Springgreen2: "springgreen2";
			case Springgreen3: "springgreen3";
			case Springgreen4: "springgreen4";
			case Steelblue: "steelblue";
			case Steelblue1: "steelblue1";
			case Steelblue2: "steelblue2";
			case Steelblue3: "steelblue3";
			case Steelblue4: "steelblue4";
			case Tan: "tan";
			case Tan1: "tan1";
			case Tan2: "tan2";
			case Tan3: "tan3";
			case Tan4: "tan4";
			case Thistle: "thistle";
			case Thistle1: "thistle1";
			case Thistle2: "thistle2";
			case Thistle3: "thistle3";
			case Thistle4: "thistle4";
			case Tomato: "tomato";
			case Tomato1: "tomato1";
			case Tomato2: "tomato2";
			case Tomato3: "tomato3";
			case Tomato4: "tomato4";
			case Transparent: "transparent";
			case Turquoise: "turquoise";
			case Turquoise1: "turquoise1";
			case Turquoise2: "turquoise2";
			case Turquoise3: "turquoise3";
			case Turquoise4: "turquoise4";
			case Violet: "violet";
			case Violetred: "violetred";
			case Violetred1: "violetred1";
			case Violetred2: "violetred2";
			case Violetred3: "violetred3";
			case Violetred4: "violetred4";
			case Wheat: "wheat";
			case Wheat1: "wheat1";
			case Wheat2: "wheat2";
			case Wheat3: "wheat3";
			case Wheat4: "wheat4";
			case White: "white";
			case Whitesmoke: "whitesmoke";
			case Yellow: "yellow";
			case Yellow1: "yellow1";
			case Yellow2: "yellow2";
			case Yellow3: "yellow3";
			case Yellow4: "yellow4";
			case Yellowgreen: "yellowgreen";
		}
	}

	static public function printCompassPoint(cp:CompassPoint) {
		return switch (cp) {
			case N: "n";
			case NE: "ne";
			case E: "e";
			case SE: "se";
			case S: "s";
			case SW: "sw";
			case W: "w";
			case NW: "nw";
			case C: "c";
			case _: "_";
		}
	}

	static public function printDirType(dt:DirType) {
		return switch (dt) {
			case Forward: "forward";
			case Back: "back";
			case Both: "both";
			case None: "none";
		}
	}

	static public function printDoubleList(dl:Array<Float>) {
		return dl.join(":");
	}

	static public function printDoubleOrPoint(dop:DoubleOrPoint) {
		return switch (dop) {
			case Double(f): '$f';
			case Point(p): printPoint(p);
		}
	}

	static public function printDoubleOrString(dos:DoubleOrString) {
		return switch (dos) {
			case Double(f): '$f';
			case String(s): '"$s"';
		}
	}

	static public function printImageScale(ims:ImageScale) {
		return switch (ims) {
			case False: "false";
			case True: "true";
			case Width: "width";
			case Height: "height";
			case Both: "both";
		}
	}

	static public function printOutputMode(om:OutputMode) {
		return switch (om) {
			case BreadthFirst: "breadthfirst";
			case NodesFirst: "nodesfirst";
			case EdgesFirst: "edgesfirst";
		}
	}

	static public function printPackMode(pm:PackMode) {
		return switch (pm) {
			case Node: "node";
			case Clust: "clust";
			case Graph: "graph";
			case Array(flags, n): 'array${(flags != "" ? '_$flags' : "")}${(n != null ? '$n' : "")}}';
		}
	}

	static public function printPageDir(pdir:PageDir) {
		return switch (pdir) {
			case BL: "BL";
			case BR: "BR";
			case TL: "TL";
			case TR: "TR";
			case RB: "RB";
			case RT: "RT";
			case LB: "LB";
			case LT: "LT";
		}
	}

	static public function printPoint(point:Point) {
		return '"${point.x},${point.y}${(point.z != null ? ',${point.z}' : "")}${(point.dontChange ? "!" : "")}"';
	}

	static public function printPointOrSplineType(post:PointOrSplineType) {
		return switch (post) {
			case Point(p): printPoint(p);
			case SplineType(s): '"$s"';
		}
	}

	static public function printPortPos(pp:PortPos) {
		return switch (pp) {
			case CompassPoint(cp): printCompassPoint(cp);
			case PortName(s): s;
			case Both(s, cp): '$s:${printCompassPoint(cp)}';
		}
	}

	static function printQuadType(qt:QuadType) {
		return switch (qt) {
			case Normal: "normal";
			case Fast: "fast";
			case None: "none";
		}
	}

	static public function printRankDir(rd:RankDir) {
		return switch rd {
			case Tb: "TB";
			case Lr: "LR";
			case Bt: "BT";
			case Rl: "RL";
		}
	}

	static public function printRankType(rt:RankType) {
		return switch (rt) {
			case Same: "same";
			case Min: "min";
			case Source: "source";
			case Max: "max";
			case Sink: "sink";
		}
	}

	static public function printRectangle(rect:Rectangle) {
		return '${rect.llx},${rect.lly},${rect.urx},${rect.ury}';
	}

	static public function printShape(sh:Shape) {
		return switch (sh) {
			case Box: "box";
			case Polygon: "polygon";
			case Ellipse: "ellipse";
			case Oval: "oval";
			case Circle: "circle";
			case Point: "point";
			case Egg: "egg";
			case Triangle: "triangle";
			case Plaintext: "plaintext";
			case Diamond: "diamond";
			case Trapezium: "trapezium";
			case Parallelogram: "parallelogram";
			case House: "house";
			case Pentagon: "pentagon";
			case Hexagon: "hexagon";
			case Septagon: "septagon";
			case Octagon: "octagon";
			case Doublecircle: "doublecircle";
			case Doubleoctagon: "doubleoctagon";
			case Tripleoctagon: "tripleoctagon";
			case Invtriangle: "invtriangle";
			case Invtrapezium: "invtrapezium";
			case Invhouse: "invhouse";
			case Mdiamond: "mdiamond";
			case Msquare: "msquare";
			case Mcircle: "mcircle";
			case Rect: "rect";
			case Rectangle: "rectangle";
			case Square: "square";
			case Star: "star";
			case None: "none";
			case Underline: "underline";
			case Note: "note";
			case Tab: "tab";
			case Folder: "folder";
			case Box3d: "box3d";
			case Component: "component";
			case Promoter: "promoter";
			case Cds: "cds";
			case Terminator: "terminator";
			case Utr: "utr";
			case Primersite: "primersite";
			case Restrictionsite: "restrictionsite";
			case Fivepoverhang: "fivepoverhang";
			case Threepoverhang: "threepoverhang";
			case Noverhang: "noverhang";
			case Assembly: "assembly";
			case Signature: "signature";
			case Insulator: "insulator";
			case Ribosite: "ribosite";
			case Rnastab: "rnastab";
			case Proteasesite: "proteasesite";
			case Proteinstab: "proteinstab";
			case Rpromoter: "rpromoter";
			case Rarrow: "rarrow";
			case Larrow: "larrow";
			case Lpromoter: "lpromoter";
		}
	}

	static public function printSmoothType(st:SmoothType) {
		return switch (st) {
			case None: "none";
			case AvgDist: "avg_dist";
			case GraphDist: "graph_dist";
			case PowerDist: "power_dist";
			case Rng: "rng";
			case Spring: "spring";
			case Triangle: "triangle";
		}
	}

	static public function printSpline(spline:Spline) {
		return switch (spline) {
			case None: "none";
			case Line: "line";
			case Polyline: "polyline";
			case Curved: "curved";
			case Ortho: "ortho";
			case Spline: "spline";
		}
	}

	static public function printStyle(st:Style) {
		return switch (st) {
			case Dashed: "dashed";
			case Dotted: "dotted";
			case Solid: "solid";
			case Invis: "invis";
			case Bold: "bold";
			case Tapered: "tapered";
			case Filled: "filled";
			case Striped: "striped";
			case Wedged: "wedged";
			case Diagonals: "diagonals";
			case Rounded: "rounded";
		}
	}
}
