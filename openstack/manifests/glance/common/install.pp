class openstack::glance::common::install {
	package { "$openstack::glance::params::packagename":
		ensure	=> present,
	}
}
