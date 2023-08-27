package config;

import haxe.Json;
import haxe.io.Path;
import lime.system.System;
import prism.util.structs.Account;
import prism.util.structs.Author;
import sys.FileSystem;
import sys.io.File;

class Profiles {
	private static var profiles:Array<Account> = new Array();
	private static var activeProfile:Int = 0;
	private static var storagePath = Path.join([System.applicationStorageDirectory, "profiles.json"]);

	public static function getActiveProfile() {
		return profiles[activeProfile];
	}

	public static function setActiveProfile(profile:Int) {
		activeProfile = profile;
	}

	public static function getProfiles() {
		return profiles;
	}

	public static function getProfile(i:Int) {
		return profiles[i];
	}

	public static function addAccount(account:Account) {
		profiles.push(account);
		save();
	}

	public static function convertAuthorProfile(account:Account):Author {
		if (account != null)
			return {
				username: account.username,
				userID: account.userID,
				pfp: account.profile.pfp,
				displayName: account.profile.displayName
			};
		else
			return null;
	}

	public static function save() {
		File.saveContent(storagePath, Json.stringify(profiles));
	}

	public static function load() {
		if (FileSystem.exists(storagePath))
			profiles = Json.parse(File.getContent(storagePath));
	}
}
