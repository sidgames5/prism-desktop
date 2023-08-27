package;

import activities.MainActivity;
import activities.WelcomeActivity;
import config.Chats;
import config.Profiles;
import flixel.FlxG;
import flixel.FlxGame;
import haxe.crypto.Sha256;
import haxe.io.Bytes;
import openfl.Lib;
import openfl.display.Sprite;

class Main extends Sprite {
	public function new() {
		super();

		// var un = 'Tester${Math.round(Math.random() * 100)}';
		// Profiles.addAccount({
		// 	username: un,
		// 	userID: Math.round(Math.random() * 1000),
		// 	profile: {
		// 		pfp: null,
		// 		displayName: un,
		// 		bio: "hi"
		// 	},
		// 	password: Sha256.make(Bytes.ofString("password"))
		// });

		Profiles.load();
		Chats.load();

		Chats.reset();
		Chats.add({
			name: "Test convo 1",
			icon: null,
			host: "s1.prism.local",
			convoId: 1
		});

		if (Profiles.getProfiles().length < 1) {
			Lib.current.addChild(new FlxGame(0, 0, WelcomeActivity, 60, 60, true, false));
		} else {
			Lib.current.addChild(new FlxGame(0, 0, MainActivity, 60, 60, true, false));
		}
		FlxG.autoPause = false;
		FlxG.mouse.useSystemCursor = true;
	}
}
