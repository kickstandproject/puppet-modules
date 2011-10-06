class ntp::service {
	service { 'ntp':
		name		=> $ntp::params::servicename,
		enable		=> true,
		ensure		=> running,
		hasrestart	=> true,
		hasstatus	=> $ntp::params::hasstatus,
		require		=> Class["ntp::config"],
	}
}
