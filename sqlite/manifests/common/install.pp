class sqlite::common::install {
	package { "$sqlite::params::packagename":
		ensure	=> present,
	}
}
