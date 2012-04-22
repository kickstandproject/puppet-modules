class mcollective::classes::apt {

	apt::source { "lucid_universe":
		location	=> "http://ca.archive.ubuntu.com/ubuntu/",
		release		=> "lucid",
		repos		=> "universe",
	}

	apt::source { "lucid_updates_universe":
		location	=> "http://ca.archive.ubuntu.com/ubuntu/",
		release		=> "lucid-updates",
		repos		=> "universe",
	}

	apt::source { "puppetlabs":
		location	=> "http://apt.puppetlabs.com/",
		release		=> "lucid",
		repos		=> "main",
		key		=> "4BD6EC30",
	}
}
