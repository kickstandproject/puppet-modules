class rsyslog::classes::install {
	package { 'rsyslog':
		name	=> $rsyslog::params::packagename,
		ensure	=> present,
	}
}
