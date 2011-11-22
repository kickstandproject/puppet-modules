class rsyslog::classes::service {
	service { 'rsyslog':
		name		=> $rsyslog::params::servicename,
		enable		=> true,
		ensure		=> running,
		hasrestart	=> true,
		hasstatus	=> $rsyslog::params::hasstatus,
		require		=> Class['rsyslog::classes::config'],
	}
}
