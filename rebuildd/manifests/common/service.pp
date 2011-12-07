class rebuildd::common::service {
	service { "$rebuildd::params::servicename":
		enable		=> true,
		ensure		=> running,
		hasrestart	=> true,
		hasstatus	=> $rebuildd::params::hasstatus,
		require		=> Class['rebuildd::common::config'],
	}
}
