class mysql::common::install {
	package { "$mysql::params::packagename":
		ensure	=> present,
	}
}
