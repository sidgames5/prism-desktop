package config;

class Hosts {
	private static var list = ["s1.prism.local", "s2.prism.local"];

	public static function getAll() {
		return list;
	}

	public static function add(h:String) {
		list.push(h);
	}

	public static function getRandom() {
		return Random.fromArray(list);
	}

	public static function getFirst() {
		return list[0];
	}

	public static function update() {
		// TODO
	}

	public static function report() {
		// TODO
	}
}
