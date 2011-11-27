class nagios::common::service {
	service { 'nagios':
		name		=> $nagios::params::servicename,
		enable		=> true,
		ensure		=> running,
		hasrestart	=> true,
		hasstatus	=> $nagios::params::hasstatus,
		require		=> Class['nagios::common::config'],
	}
}
