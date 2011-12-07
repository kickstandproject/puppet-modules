class rebuildd::common::install {
	package { "$rebuildd::params::packagename":
		ensure	=> present,
	}
}
