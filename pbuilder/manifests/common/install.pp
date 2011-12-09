class pbuilder::common::install {
	package { "$pbuilder::params::packagename":
		ensure	=> present,
	}
}
