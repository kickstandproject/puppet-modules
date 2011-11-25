class nagios::nsca::common::install {
	package { 'nagios_nsca':
		name	=> $nagios::nsca::params::packagename,
		ensure	=> present,
	}
	if defined(Class['nagios::nsca::client']) {
	}
}
