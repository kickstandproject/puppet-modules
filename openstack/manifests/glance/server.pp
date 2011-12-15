class openstack::glance::server inherits openstack::glance::common::init {
	if ($openstack::glance::params::db == 'sqlite') {
		include openstack::glance::common::sqlite
	}
}
