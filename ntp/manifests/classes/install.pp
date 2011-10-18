class ntp::classes::install {
	package { $ntp::params::packagename:
		ensure => present,
	}
}
