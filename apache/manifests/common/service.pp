class apache::common::service {
	service { $apache::params::servicename:
		enable		=> true,
		ensure		=> running,
		hasrestart	=> true,
		hasstatus	=> $apache::params::hasstatus,
		require		=> Class['apache::common::config'],
	}
}
