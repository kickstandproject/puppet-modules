class openstack::glance::common::service {
	service { "$openstack::glance::params::servicename":
		enable		=> true,
		ensure		=> running,
		hasrestart	=> true,
		hasstatus	=> $openstack::glance::params::hasstatus,
		require		=> Class['openstack::glance::common::config'],
	}
}
