package activities;

import Reference.sf;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import util.Colors;

using StringTools;

class PhoneActivity extends FlxState {
	private static var background:FlxSprite;
	private static var title:FlxText;
	private static var titleBg:FlxSprite;

	private static var selectorBg:FlxSprite;
	private static var selectorUnderline:FlxSprite;
	private static var selectorText1:FlxText;
	private static var selectorText2:FlxText;
	private static var selectorText3:FlxText;
	private static final selectorItems:Int = 3;

	private static var button1:FlxText;
	private static var button2:FlxText;
	private static var button3:FlxText;
	private static var button4:FlxText;
	private static var button5:FlxText;
	private static var button6:FlxText;
	private static var button7:FlxText;
	private static var button8:FlxText;
	private static var button9:FlxText;
	private static var button0:FlxText;
	private static var buttonBack:FlxText;
	private static var buttonHash:FlxText;
	private static var buttonDial:FlxSprite;
	private static var numberDisp:FlxText;
	private static var number:String = "";

	override public function create() {
		super.create();

		number = "";

		background = new FlxSprite();
		background.makeGraphic(FlxG.width, FlxG.height, Colors.WHITE);
		background.screenCenter(XY);
		add(background);

		title = new FlxText(0, 0, 0, "Prism Chat").setFormat("OpenSans-Regular.ttf", Math.round(sf() * 96), Colors.WHITE, CENTER);
		title.screenCenter(X);
		titleBg = new FlxSprite(0, 0);
		titleBg.makeGraphic(FlxG.width, cast title.height, Colors.DARKER);
		add(titleBg);
		add(title);

		var tb = titleBg.y + titleBg.height;
		selectorText1 = new FlxText(0, tb, 0, "Chats").setFormat("OpenSans-Regular.ttf", Math.round(sf() * 72), Colors.WHITE, CENTER);
		selectorText1.x = (FlxG.width / selectorItems) / 2 - (selectorText1.width / 2);
		selectorText2 = new FlxText(0, tb, 0, "Settings").setFormat("OpenSans-Regular.ttf", Math.round(sf() * 72), Colors.WHITE, CENTER);
		selectorText2.x = (FlxG.width / selectorItems) / 2 - (selectorText2.width / 2) + ((FlxG.width / 3) * 2);
		selectorText3 = new FlxText(0, tb, 0, "Phone").setFormat("OpenSans-Regular.ttf", Math.round(sf() * 72), Colors.WHITE, CENTER);
		selectorText3.x = (FlxG.width / selectorItems) / 2 - (selectorText3.width / 2) + ((FlxG.width / 3));
		selectorBg = new FlxSprite(0, tb);
		selectorBg.makeGraphic(FlxG.width, cast selectorText1.height, Colors.DARKEST);
		selectorUnderline = new FlxSprite();
		selectorUnderline.makeGraphic(cast(FlxG.width / selectorItems), cast selectorBg.height / 8, Colors.WHITE);
		selectorUnderline.x = FlxG.width * (1 / 3);
		selectorUnderline.y = selectorBg.y + selectorBg.height - selectorUnderline.height;
		add(selectorBg);
		add(selectorText1);
		add(selectorText2);
		add(selectorText3);
		add(selectorUnderline);

		numberDisp = new FlxText(0, 0, 0, number).setFormat("OpenSans-Regular.ttf", Math.round(sf() * 72), Colors.BLACK);
		numberDisp.screenCenter(X);
		numberDisp.y = (FlxG.height * 1) / 8;
		add(numberDisp);

		button1 = new FlxText(0, 0, 0, "1").setFormat("OpenSans-Regular.ttf", Math.round(sf() * 128), Colors.BLACK);
		button1.screenCenter(X);
		button1.x -= FlxG.width / 4;
		button1.y = (FlxG.height * 2) / 8;
		add(button1);
		button2 = new FlxText(0, 0, 0, "2").setFormat("OpenSans-Regular.ttf", Math.round(sf() * 128), Colors.BLACK);
		button2.screenCenter(X);
		button2.y = (FlxG.height * 2) / 8;
		add(button2);
		button3 = new FlxText(0, 0, 0, "3").setFormat("OpenSans-Regular.ttf", Math.round(sf() * 128), Colors.BLACK);
		button3.screenCenter(X);
		button3.x += FlxG.width / 4;
		button3.y = (FlxG.height * 2) / 8;
		add(button3);

		button4 = new FlxText(0, 0, 0, "4").setFormat("OpenSans-Regular.ttf", Math.round(sf() * 128), Colors.BLACK);
		button4.screenCenter(X);
		button4.x -= FlxG.width / 4;
		button4.y = (FlxG.height * 3) / 8;
		add(button4);
		button5 = new FlxText(0, 0, 0, "5").setFormat("OpenSans-Regular.ttf", Math.round(sf() * 128), Colors.BLACK);
		button5.screenCenter(X);
		button5.y = (FlxG.height * 3) / 8;
		add(button5);
		button6 = new FlxText(0, 0, 0, "6").setFormat("OpenSans-Regular.ttf", Math.round(sf() * 128), Colors.BLACK);
		button6.screenCenter(X);
		button6.x += FlxG.width / 4;
		button6.y = (FlxG.height * 3) / 8;
		add(button6);

		button7 = new FlxText(0, 0, 0, "7").setFormat("OpenSans-Regular.ttf", Math.round(sf() * 128), Colors.BLACK);
		button7.screenCenter(X);
		button7.x -= FlxG.width / 4;
		button7.y = (FlxG.height * 4) / 8;
		add(button7);
		button8 = new FlxText(0, 0, 0, "8").setFormat("OpenSans-Regular.ttf", Math.round(sf() * 128), Colors.BLACK);
		button8.screenCenter(X);
		button8.y = (FlxG.height * 4) / 8;
		add(button8);
		button9 = new FlxText(0, 0, 0, "9").setFormat("OpenSans-Regular.ttf", Math.round(sf() * 128), Colors.BLACK);
		button9.screenCenter(X);
		button9.x += FlxG.width / 4;
		button9.y = (FlxG.height * 4) / 8;
		add(button9);

		button0 = new FlxText(0, 0, 0, "0").setFormat("OpenSans-Regular.ttf", Math.round(sf() * 128), Colors.BLACK);
		button0.screenCenter(X);
		button0.y = (FlxG.height * 5) / 8;
		add(button0);
		buttonBack = new FlxText(0, 0, 0, "<").setFormat("OpenSans-Regular.ttf", Math.round(sf() * 128), Colors.BLACK);
		buttonBack.screenCenter(X);
		buttonBack.x += FlxG.width / 4;
		buttonBack.y = (FlxG.height * 5) / 8;
		add(buttonBack);

		buttonDial = new FlxSprite();
		buttonDial.makeGraphic(128, 128, Colors.DARKER);
		buttonDial.screenCenter(X);
		buttonDial.y = (FlxG.height * 6) / 8;
		add(buttonDial);
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);

		numberDisp.text = number;

		if (FlxG.mouse.overlaps(selectorText1) && FlxG.mouse.justPressed)
			FlxG.switchState(new MainActivity());
		if (FlxG.mouse.overlaps(selectorText2) && FlxG.mouse.justPressed)
			FlxG.switchState(new SettingsActivity());

		if (FlxG.mouse.overlaps(button1) && FlxG.mouse.justPressed)
			addNum(1);
		if (FlxG.mouse.overlaps(button2) && FlxG.mouse.justPressed)
			addNum(2);
		// if (lt.justPressed && lt.getPosition().inCoords(button3.x, button3.y, button3.width, button3.height))
		// 	addNum(3);
		// if (lt.justPressed && lt.getPosition().inCoords(button4.x, button4.y, button4.width, button4.height))
		// 	addNum(4);
		// if (lt.justPressed && lt.getPosition().inCoords(button5.x, button5.y, button5.width, button5.height))
		// 	addNum(5);
		// if (lt.justPressed && lt.getPosition().inCoords(button6.x, button6.y, button6.width, button6.height))
		// 	addNum(6);
		// if (lt.justPressed && lt.getPosition().inCoords(button7.x, button7.y, button7.width, button7.height))
		// 	addNum(7);
		// if (lt.justPressed && lt.getPosition().inCoords(button8.x, button8.y, button8.width, button8.height))
		// 	addNum(8);
		// if (lt.justPressed && lt.getPosition().inCoords(button9.x, button9.y, button9.width, button9.height))
		// 	addNum(9);
		// if (lt.justPressed && lt.getPosition().inCoords(button0.x, button0.y, button0.width, button0.height))
		// 	addNum(0);
		// if (lt.justPressed && lt.getPosition().inCoords(buttonBack.x, buttonBack.y, buttonBack.width, buttonBack.height))
		// 	backspace();
	}

	private static function addNum(n:Int) {
		number += '$n';
		numberDisp.screenCenter(X);
	}

	private static function backspace() {
		number = number.substr(0, number.length - 1);
		numberDisp.screenCenter(X);
	}
}
