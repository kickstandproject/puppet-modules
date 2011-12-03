class ntp::common::install {
	package { "$ntp::params::packagename":
		ensure => present,
	}
}
