package config;

import haxe.Json;
import haxe.io.Path;
import lime.system.System;
import structs.Chat;
import sys.FileSystem;
import sys.io.File;

class Chats {
	private static var chats = new Array<Chat>();
	private static var storagePath = Path.join([System.applicationStorageDirectory, "chats.json"]);

	public static function get() {
		return chats;
	}

	public static function add(chat:Chat) {
		chats.push(chat);
		save();
	}

	public static function reset() {
		chats = [];
		save();
	}

	public static function save() {
		File.saveContent(storagePath, Json.stringify(chats));
	}

	public static function load() {
		if (FileSystem.exists(storagePath))
			chats = Json.parse(File.getContent(storagePath));
	}
}
