class asterisk::classes::ppa {

	apt::ppa { "ppa:pabelanger/testing": }

	apt::source { "lucid_universe":
		location => "http://ca.archive.ubuntu.com/ubuntu/",
		release => "lucid",
		repos => "universe",
	}

	apt::source { "lucid_updates_universe":
		location => "http://ca.archive.ubuntu.com/ubuntu/",
		release => "lucid-updates",
		repos => "universe",
	}
}
