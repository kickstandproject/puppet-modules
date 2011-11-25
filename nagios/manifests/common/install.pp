class nagios::common::install {
	package { "$nagios::params::packagename":
		ensure	=> present,
	}
}
