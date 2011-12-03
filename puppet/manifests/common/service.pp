class puppet::common::service {
	require puppet::params

	service { "$puppet::params::servicename":
		enable		=> true,
		ensure		=> running,
		hasrestart	=> true,
		hasstatus	=> $puppet::params::hasstatus,
		require		=> Class['puppet::common::config'],
	}
}
