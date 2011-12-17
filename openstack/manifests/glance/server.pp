class openstack::glance::server inherits openstack::glance::common::init {
	if ($openstack::glance::params::db == 'sqlite') {
		include openstack::glance::common::sqlite
	} elsif ($openstack::glance::params::db == 'mysql') {
		include openstack::glance::common::mysql
	}
}
