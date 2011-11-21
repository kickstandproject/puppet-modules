class nagios::classes::install {
	package { 'nagios':
		name	=> $nagios::params::packagename,
		ensure	=> present,
	}
}
