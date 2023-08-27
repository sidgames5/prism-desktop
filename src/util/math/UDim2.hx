package util.math;

import flixel.FlxG;

class UDim2 {
	private var xScale:Float;
	private var xOffset:Int;
	private var yScale:Float;
	private var yOffset:Int;

	public function new(xScale:Float, xOffset:Int, yScale:Float, yOffset:Int) {
		this.xScale = xScale;
		this.xOffset = xOffset;
		this.yScale = yScale;
		this.yOffset = yOffset;
	}

	public function getX():Int {
		var x = 0;

		x = Math.round(FlxG.width * xScale);
		x += xOffset;

		return x;
	}

	public function getY():Int {
		var y = 0;

		y = Math.round(FlxG.height * yScale);
		y += yOffset;

		return y;
	}

	public function getXScale():Float {
		return xScale;
	}

	public function getXOffset():Int {
		return xOffset;
	}

	public function getYScale():Float {
		return yScale;
	}

	public function getYOffset():Int {
		return yOffset;
	}

	public function setXScale(xScale:Float) {
		this.xScale = xScale;
	}

	public function setXOffset(xOffset:Int) {
		this.xOffset = xOffset;
	}

	public function setYScale(yScale:Float) {
		this.yScale = yScale;
	}

	public function setYOffset(yOffset:Int) {
		this.yOffset = yOffset;
	}
}
