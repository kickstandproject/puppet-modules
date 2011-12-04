class git::common::install {
	package { "$git::params::packagename",
		ensure	=> present,
	}
}
