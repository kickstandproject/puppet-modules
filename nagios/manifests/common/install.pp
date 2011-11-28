class nagios::common::install {
	package { 'nagios':
		name	=> $nagios::params::packagename,
		ensure	=> present,
	}
	if defined(Class['nagios::client']) {
	}
}
