class mysql::classes::service {
	service { 'mysql':
		name		=> $mysql::params::servicename,
		enable		=> true,
		ensure		=> running,
		hasrestart	=> true,
		hasstatus	=> $mysql::params::hasstatus,
		require		=> Class['mysql::classes::config'],
	}
}
