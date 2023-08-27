package activities;

import Reference.sf;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import util.Colors;

class WelcomeActivity extends FlxState {
	private static var background:FlxSprite;

	private static var title:FlxText;
	private static var subtitle:FlxText;

	private static var loginButton:FlxText;
	private static var loginButtonBg:FlxSprite;

	private static var signupButton:FlxText;
	private static var signupButtonBg:FlxSprite;

	override public function create() {
		super.create();

		background = new FlxSprite();
		background.makeGraphic(FlxG.width, FlxG.height, Colors.WHITE);
		background.screenCenter(XY);
		add(background);

		title = new FlxText(0, 0, 0, "Prism Chat").setFormat("OpenSans-Regular.ttf", Math.round(sf() * 256), Colors.BLACK, CENTER);
		// title.wordWrap = true;
		title.screenCenter(X);
		title.y = FlxG.height / 10;
		add(title);
		subtitle = new FlxText(0, 0, 0, "A new way to chat").setFormat("OpenSans-Light.ttf", Math.round(112 * sf()), Colors.BLACK, CENTER);
		// subtitle.wordWrap = true;
		subtitle.screenCenter(X);
		subtitle.y = title.y + title.height;
		add(subtitle);

		signupButton = new FlxText(0, 0, 0, "Sign up").setFormat("OpenSans-Regular.ttf", Math.round(96 * sf()), Colors.WHITE);
		signupButton.screenCenter(XY);
		signupButton.y += FlxG.height / 4;
		signupButtonBg = new FlxSprite();
		signupButtonBg.makeGraphic(cast signupButton.width + 25, cast signupButton.height + 25, Colors.DARKER);
		signupButtonBg.screenCenter(XY);
		signupButtonBg.y += FlxG.height / 4;
		add(signupButtonBg);
		add(signupButton);

		loginButton = new FlxText(0, 0, 0, "Login").setFormat("OpenSans-Regular.ttf", Math.round(96 * sf()), Colors.BLACK);
		loginButton.screenCenter(XY);
		loginButton.y = signupButton.y;
		loginButtonBg = new FlxSprite();
		loginButtonBg.makeGraphic(cast loginButton.width + 25, cast loginButton.height + 25, Colors.LIGHT_GRAY);
		loginButtonBg.screenCenter(XY);
		loginButtonBg.y = signupButtonBg.y;
		add(loginButtonBg);
		add(loginButton);

		var lswidth = signupButtonBg.width + loginButtonBg.width;
		signupButton.x -= lswidth / 2;
		signupButtonBg.x -= lswidth / 2;
		loginButton.x += lswidth / 2;
		loginButtonBg.x += lswidth / 2;
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);

		if (FlxG.mouse.overlaps(loginButtonBg) && FlxG.mouse.justPressed)
			FlxG.switchState(new MainActivity());
		if (FlxG.mouse.overlaps(signupButtonBg) && FlxG.mouse.justPressed)
			FlxG.switchState(new MainActivity());
	}
}
