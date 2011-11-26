class nagios::classes::install {
	package { 'nagios':
		name	=> $nagios::params::packagename,
		ensure	=> present,
	}
	if defined(Class['nagios::client']) {
		package { 'nagios-client':
			name	=> $nagios::params::packagename_client,
			ensure	=> present,
		}
	}
}
