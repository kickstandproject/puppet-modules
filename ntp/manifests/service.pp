class ntp::service {
	service { $ntp::params::ntp_service_name:
		ensure => running,
		hasstatus => true,
		hasrestart => true,
		enable => true,
		require => Class["ntp::config"],
	}
}
