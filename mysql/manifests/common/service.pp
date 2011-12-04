class mysql::common::service {
	require mysql::params

	service { "$mysql::params::servicename":
		enable		=> true,
		ensure		=> running,
		hasrestart	=> true,
		hasstatus	=> $mysql::params::hasstatus,
		require		=> Class['mysql::common::config'],
	}
}
