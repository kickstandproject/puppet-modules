class nagios::nsca::common::service {
	if defined(Class['nagios::nsca::client']) {
		$ensure = stopped
	} else {
		$ensure = running
	}

	service { 'nagios_nsca':
		name		=> $nagios::nsca::params::servicename,
		enable		=> true,
		ensure		=> $ensure,
		hasrestart	=> true,
		hasstatus	=> $nagios::nsca::params::hasstatus,
		require		=> Class['nagios::nsca::common::config'],
	}
}
