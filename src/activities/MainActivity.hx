package activities;

import config.Chats;
import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.touch.FlxTouch;
import flixel.input.touch.FlxTouchManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import prism.util.Instructions;
import structs.Chat;
import util.Colors;

class MainActivity extends FlxState {
	private static var background:FlxSprite;
	private static var title:FlxText;
	private static var titleBg:FlxSprite;

	private static var selectorBg:FlxSprite;
	private static var selectorUnderline:FlxSprite;
	private static var selectorText1:FlxText;
	private static var selectorText2:FlxText;
	private static var selectorText3:FlxText;
	private static final selectorItems:Int = 3;

	private static var newChatBg:FlxSprite;
	private static var newChatIcon:FlxSprite;

	private static var chats = new Array<Chat>();
	private static final hitboxes = new Array<FlxObject>();

	override public function create() {
		super.create();

		hitboxes.resize(0);
		chats = Chats.get();

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
		selectorUnderline.x = FlxG.width * 0;
		selectorUnderline.y = selectorBg.y + selectorBg.height - selectorUnderline.height;
		add(selectorBg);
		add(selectorText1);
		add(selectorText2);
		add(selectorText3);
		add(selectorUnderline);

		for (chat in chats) {
			var text = new FlxText(0, 0, 0, chat.name).setFormat("OpenSans-Regular.ttf", 84, Colors.BLACK, LEFT);
			var hh = selectorBg.y + selectorBg.height;
			if (hitboxes.length > 0)
				hh = hitboxes[hitboxes.length - 1].y + hitboxes[hitboxes.length - 1].height;
			text.y = hh;
			add(text);
			var hitbox = new FlxSprite(0, hh);
			hitbox.makeGraphic(FlxG.width, cast text.height, FlxColor.TRANSPARENT);
			add(hitbox);
			hitboxes.push(hitbox);
		}

		newChatBg = new FlxSprite();
		newChatBg.makeGraphic(128, 128, Colors.DARKER);
		newChatBg.x = FlxG.width - newChatBg.width - 50;
		newChatBg.y = FlxG.height - newChatBg.height - 50;
		add(newChatBg);
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);

		if (FlxG.mouse.overlaps(selectorText2) && FlxG.mouse.justPressed)
			FlxG.switchState(new SettingsActivity());
		if (FlxG.mouse.overlaps(selectorText3) && FlxG.mouse.justPressed)
			FlxG.switchState(new PhoneActivity());
		if (FlxG.mouse.overlaps(newChatBg) && FlxG.mouse.justPressed)
			FlxG.switchState(new AddConvoActivity());

		for (i in 0...chats.length) {
			var chat = chats[i];
			var hitbox = hitboxes[i];
			if (FlxG.mouse.overlaps(hitbox) && FlxG.mouse.justPressed) {
				FlxG.switchState(new ChatActivity(chat));
			}
		}
	}
}
