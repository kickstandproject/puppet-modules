class openstack::glance::common::monitor {
	require openstack::glance::params

	monitor::process { 'openstack_glance_process':
		process	=> "$openstack::glance::params::processname",
	}
}
