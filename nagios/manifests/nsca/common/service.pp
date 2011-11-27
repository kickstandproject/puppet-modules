class nagios::nsca::common::service {
	service { 'nagios_nsca':
		name		=> $nagios::nsca::params::servicename,
		enable		=> true,
		ensure		=> running,
		hasrestart	=> true,
		hasstatus	=> $nagios::nsca::params::hasstatus,
		require		=> Class['nagios::nsca::common::config'],
	}
}
