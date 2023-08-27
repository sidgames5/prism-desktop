package activities;

import config.Chats;
import config.Hosts;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import gui.InputField;
import prism.accounts.Accounts;
import prism.chat.Conversations;
import prism.util.structs.Account;
import util.Colors;
import Reference.sf;

using StringTools;

class AddConvoActivity extends FlxState {
	private static var background:FlxSprite;
	private static var title:FlxText;
	private static var titleBg:FlxSprite;
	private static var backButton:FlxSprite;

	private static var nameField:InputField;
	private static var participantField:InputField;
	private static var participantButton:FlxSprite;
	private static var participants:Array<FlxText> = [];
	private static var rparticipants:Array<Account> = [];

	private static var createButton:FlxText;

	private static var host:String;

	override public function create() {
		super.create();

		host = Hosts.getFirst();

		background = new FlxSprite();
		background.makeGraphic(FlxG.width, FlxG.height, Colors.WHITE);
		background.screenCenter(XY);
		add(background);

		title = new FlxText(0, 0, 0, "New Chat").setFormat("OpenSans-Regular.ttf", Math.round(sf() * 96), Colors.WHITE, CENTER);
		title.screenCenter(X);
		titleBg = new FlxSprite(0, 0);
		titleBg.makeGraphic(FlxG.width, cast title.height, Colors.DARKER);
		add(titleBg);
		add(title);

		backButton = new FlxSprite();
		backButton.loadGraphic("res/images/back.png");
		add(backButton);

		nameField = new InputField(0, 0, FlxG.width, "Chat name", Math.round(sf() * 96), Colors.BLACK, Colors.LIGHT_GRAY);
		nameField.font = "OpenSans-Regular.ttf";
		nameField.y = titleBg.height + titleBg.y;
		add(nameField);

		participantField = new InputField(0, 0, FlxG.width - 192, "Number of user", Math.round(sf() * 96), Colors.BLACK, Colors.LIGHT_GRAY);
		participantField.font = "OpenSans-Regular.ttf";
		participantField.y = nameField.frameHeight + nameField.y;
		add(participantField);

		participantButton = new FlxSprite();
		participantButton.makeGraphic(192, participantField.frameHeight, Colors.DARKER);
		participantButton.x = participantField.fieldWidth;
		participantButton.y = participantField.y;
		add(participantButton);

		createButton = new FlxText(0, 0, 0, "Create").setFormat("OpenSans-Regular.ttf", Math.round(sf() * 64), Colors.BLACK);
		createButton.screenCenter(X);
		createButton.y = FlxG.height - createButton.height;
		add(createButton);
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);

		if (FlxG.mouse.overlaps(backButton) && FlxG.mouse.justPressed)
			FlxG.switchState(new MainActivity());

		if (FlxG.mouse.overlaps(participantButton) && FlxG.mouse.justPressed) {
			var num = 0;
			try
				num = Std.parseInt(participantField.text);
			addParticipant(Accounts.getFromID(num, host));
			participantField.text = "Number of user";
		}

		if (FlxG.mouse.overlaps(createButton) && FlxG.mouse.justPressed) {
			var id = Conversations.register({
				name: nameField.text,
				participants: rparticipants
			}, host);
			Chats.add({
				name: nameField.text,
				icon: null,
				host: host,
				convoId: id
			});
			FlxG.switchState(new ChatActivity(Chats.get()[Chats.get().length - 1]));
		}
	}

	private function addParticipant(p:Account) {
		var ft = new FlxText(0, 0, 0, p.profile.displayName).setFormat("OpenSans-Regular.ttf", Math.round(sf() * 64), Colors.BLACK);
		if (participants.length > 0)
			ft.y = participants[participants.length - 1].y + participants[participants.length - 1].height;
		else
			ft.y = participantField.y + participantField.frameHeight;
		participants.push(ft);
		rparticipants.push(p);
		add(participants[participants.length - 1]);
	}
}
