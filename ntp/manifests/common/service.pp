class ntp::common::service {
	service { "$ntp::params::servicename":
		enable		=> true,
		ensure		=> running,
		hasrestart	=> true,
		hasstatus	=> $ntp::params::hasstatus,
		require		=> Class['ntp::common::config'],
	}
}
