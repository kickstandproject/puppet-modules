class openstack::glance::common::config {
	file { "$openstack::glance::params::configfile_registry":
		content	=> template('openstack/glance/server/glance-registry.conf.erb'),
		ensure	=> present,
		group	=> $openstack::glance::params::configfile_group,
		mode	=> $openstack::glance::params::configfile_mode,
		notify	=> Class['openstack::glance::common::service'],
		owner	=> $openstack::glance::params::configfile_owner,
		require => Class['openstack::glance::common::install'],
	}
}
