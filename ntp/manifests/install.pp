class ntp::install {
	package { $ntp::params::packagename:
		ensure => present,
	}
}
