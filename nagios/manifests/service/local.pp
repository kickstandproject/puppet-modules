define nagios::service::local (
	$check_command = false,
	$description,
	$ensure = present,
	$hostgroup_name = 'all',
	$use = 'generic-service-active'
	) {
	require nagios::client

	$fname = regsubst($name, "\W", "_", "G")

	nagios_service { $name:
		check_command		=> $check_command ? {
			false	=> $name,
			default	=> $check_command,
		},
		ensure			=> $ensure,
		hostgroup_name		=> $hostgroup_name,
		notify			=> Class['nagios::common::service'],
		service_description	=> $description,
		target			=> "$nagios::params::configdir/services/$fname.cfg",
		use			=> $use,
	}

	file { "$nagios::params::configdir/services/$fname.cfg":
		before	=> Nagios_service[$name],
		ensure	=> $ensure,
	}
}
