package activities;

import cache.Received;
import config.Profiles;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.ui.FlxInputText;
import flixel.input.android.FlxAndroidKey;
import flixel.input.android.FlxAndroidKeys;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import gui.InputField;
import haxe.crypto.Crc32;
import haxe.io.Bytes;
import openfl.text.TextField;
import openfl.ui.Keyboard;
import prism.chat.Receiver;
import prism.chat.Sender;
import structs.Chat;
import structs.DMessage;
import sys.thread.Thread;
import util.Colors;

class ChatActivity extends FlxState {
	private static var background:FlxSprite;
	private static var title:FlxText;
	private static var titleBg:FlxSprite;
	private static var backButton:FlxSprite;

	private static var currentChat:Chat;

	private static var textField:InputField;
	private static var sendButtonBg:FlxSprite;
	private static var sendButtonIcon:FlxSprite;

	private static var messages:Array<FlxText> = [];

	private static var fetchThread:Thread;

	public function new(chat:Chat) {
		super();
		currentChat = chat;
	}

	override public function create() {
		super.create();

		background = new FlxSprite();
		background.makeGraphic(FlxG.width, FlxG.height, Colors.WHITE);
		background.screenCenter(XY);
		add(background);

		title = new FlxText(0, 0, 0, currentChat.name).setFormat("OpenSans-Regular.ttf", 96, Colors.WHITE, CENTER);
		title.screenCenter(X);
		titleBg = new FlxSprite(0, 0);
		titleBg.makeGraphic(FlxG.width, cast title.height, Colors.DARKER);
		add(titleBg);
		add(title);

		backButton = new FlxSprite();
		backButton.loadGraphic("res/images/back.png");
		add(backButton);

		textField = new InputField(0, 0, FlxG.width - 192, "Type a message", 96, Colors.BLACK, Colors.LIGHT_GRAY);
		textField.fieldWidth = FlxG.width - textField.height;
		textField.lines = 1;
		textField.maxLength = 500;
		textField.font = "OpenSans-Regular.ttf";
		textField.x = 0;
		textField.y = titleBg.y + titleBg.height;
		add(textField);

		sendButtonBg = new FlxSprite();
		sendButtonBg.makeGraphic(cast textField.height, cast textField.height, Colors.GRAY);
		sendButtonBg.x = textField.fieldWidth + textField.x;
		sendButtonBg.y = textField.y;
		add(sendButtonBg);

		var history = Receiver.getMultiple(currentChat.host + "/" + currentChat.convoId, 10);
		if (history != null) {
			for (m in history)
				if (m != null)
					addMessage({self: m.author.userID == Profiles.getActiveProfile().userID, message: m});
		}

		fetchThread = Thread.create(() -> {
			while (true) {
				fetch();
				Sys.sleep(5);
			}
		});
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);

		if (FlxG.mouse.overlaps(backButton) && FlxG.mouse.justPressed)
			FlxG.switchState(new MainActivity());

		if (FlxG.mouse.overlaps(sendButtonBg) && FlxG.mouse.justPressed && sendButtonBg.color == Colors.DARK) {
			var mc = textField.text;
			var ma = Profiles.convertAuthorProfile(Profiles.getActiveProfile());
			var mt = Sys.time();
			Sender.send({
				content: mc,
				author: ma,
				timestamp: cast mt,
				crc32: Crc32.make(Bytes.ofString(mc + ma + mt))
			}, currentChat.host + "/" + currentChat.convoId);
			textField.text = "Type a message";
			fetch();
		}

		if (textField.text.length > 0 && textField.text != "Type a message")
			sendButtonBg.color = Colors.DARK;
		else
			sendButtonBg.color = Colors.GRAY;
	}

	public function addMessage(dm:DMessage) {
		if (!Received.list.contains(dm.message.id)) {
			var t = dm.message.author.displayName + ": " + dm.message.content;
			if (dm.self)
				t = dm.message.content;
			var fm = new FlxText(0, 0, 0, t).setFormat("OpenSans-Regular.ttf", 64, Colors.BLACK);
			var cs = Crc32.make(Bytes.ofString(dm.message.content + dm.message.author + dm.message.timestamp));
			if (cs != dm.message.crc32)
				fm.color = FlxColor.RED;
			fm.y = textField.y + textField.height;
			if (dm.self)
				fm.x = FlxG.width - fm.width;
			for (m in messages) {
				m.y += m.height;
			}
			messages.push(fm);
			add(messages[messages.length - 1]);
			Received.list.push(dm.message.id);
			// Notifications.scheduleLocalNotification(1, 0, currentChat.name, dm.message.author.displayName, dm.message.content, null, false);
		}
	}

	public function fetch() {
		var lm = Receiver.getLatest(currentChat.host + "/" + currentChat.convoId);
		if (lm != null)
			addMessage({self: lm.author.userID == Profiles.getActiveProfile().userID, message: lm});
	}
}
