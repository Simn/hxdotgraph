package dot;

import dot.Attribute;

class Common {
	static public function label(s:String) {
		return [Label(s)];
	}

	static public function code(a:Array<Attribute>) {
		a.push(FontName("Courier"));
		return a;
	}

	static public function decision(a:Array<Attribute>) {
		a.push(Shape(Diamond));
		return a;
	}

	// Color

	static public function color(a:Array<Attribute>, c:Color) {
		a.push(Color([c]));
		return a;
	}

	static public function fillcolor(a:Array<Attribute>, c:Color) {
		a.push(FillColor(c));
		return a;
	}

	// Style

	static public function filled(a:Array<Attribute>) {
		a.push(Style(Filled));
		return a;
	}

	static public function style(a:Array<Attribute>, st:Style) {
		a.push(Style(st));
		return a;
	}

	// Shape

	static public function shape(a:Array<Attribute>, sh:Shape) {
		a.push(Shape(sh));
		return a;
	}
}
