class openstack::glance::common::init {
	include openstack::glance::params
	include openstack::glance::common::install
	include openstack::glance::common::config
	include openstack::glance::common::service

	if ($monitor == 'yes') {
		include openstack::glance::common::monitor
	}
}
