class openstack::glance::common::mysql {
	require mysql::server

	package { "$openstack::glance::params::python_mysqldb":
		ensure	=> present,
	}
}
