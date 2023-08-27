package activities;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import structs.Chat;
import util.Colors;

class SettingsActivity extends FlxState {
	private static var background:FlxSprite;
	private static var title:FlxText;
	private static var titleBg:FlxSprite;

	private static var selectorBg:FlxSprite;
	private static var selectorUnderline:FlxSprite;
	private static var selectorText1:FlxText;
	private static var selectorText2:FlxText;
	private static var selectorText3:FlxText;
	private static final selectorItems:Int = 3;

	override public function create() {
		super.create();

		background = new FlxSprite();
		background.makeGraphic(FlxG.width, FlxG.height, Colors.WHITE);
		background.screenCenter(XY);
		add(background);

		title = new FlxText(0, 0, 0, "Prism").setFormat("OpenSans-Regular.ttf", 96, Colors.WHITE, CENTER);
		title.screenCenter(X);
		titleBg = new FlxSprite(0, 0);
		titleBg.makeGraphic(FlxG.width, cast title.height, Colors.DARKER);
		add(titleBg);
		add(title);

		var tb = titleBg.y + titleBg.height;
		selectorText1 = new FlxText(0, tb, 0, "Chats").setFormat("OpenSans-Regular.ttf", 72, Colors.WHITE, CENTER);
		selectorText1.x = (FlxG.width / selectorItems) / 2 - (selectorText1.width / 2);
		selectorText2 = new FlxText(0, tb, 0, "Settings").setFormat("OpenSans-Regular.ttf", 72, Colors.WHITE, CENTER);
		selectorText2.x = (FlxG.width / selectorItems) / 2 - (selectorText2.width / 2) + ((FlxG.width / 3) * 2);
		selectorText3 = new FlxText(0, tb, 0, "Phone").setFormat("OpenSans-Regular.ttf", 72, Colors.WHITE, CENTER);
		selectorText3.x = (FlxG.width / selectorItems) / 2 - (selectorText3.width / 2) + ((FlxG.width / 3));
		selectorBg = new FlxSprite(0, tb);
		selectorBg.makeGraphic(FlxG.width, cast selectorText1.height, Colors.DARKEST);
		selectorUnderline = new FlxSprite();
		selectorUnderline.makeGraphic(cast(FlxG.width / selectorItems), cast selectorBg.height / 8, Colors.WHITE);
		selectorUnderline.x = FlxG.width * (2 / 3);
		selectorUnderline.y = selectorBg.y + selectorBg.height - selectorUnderline.height;
		add(selectorBg);
		add(selectorText1);
		add(selectorText2);
		add(selectorText3);
		add(selectorUnderline);
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);

		if (FlxG.mouse.overlaps(selectorText1) && FlxG.mouse.justPressed)
			FlxG.switchState(new MainActivity());
		if (FlxG.mouse.overlaps(selectorText2) && FlxG.mouse.justPressed)
			FlxG.switchState(new PhoneActivity());
	}
}
