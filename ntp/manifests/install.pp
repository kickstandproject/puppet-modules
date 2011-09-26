class ntp::install {
	package { $ntp::params::ntp_package_name:
		ensure => installed,
	}
}
