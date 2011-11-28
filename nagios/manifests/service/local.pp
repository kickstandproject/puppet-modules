define nagios::service::local (
	$check_command = false,
	$description,
	$ensure = present,
	$host_name = false,
	$use = 'generic-service-active'
	) {

	$fname = regsubst($name, "\W", "_", "G")

	nagios_service { $name:
		check_command		=> $check_command ? {
			false	=> $fname,
			default	=> $check_command,
		},
		ensure			=> $ensure,
		host_name		=> $host_name ? {
			false	=> $hostname,
			default	=> $host_name,
		},
		notify			=> Class['nagios::common::service'],
		service_description	=> $description,
		target			=> "$nagios::params::customconfigdir/services/$fname.cfg",
		use			=> $use,
	}

	file { "$nagios::params::customconfigdir/services/$fname.cfg":
		before	=> Nagios_service[$name],
		ensure	=> $ensure,
	}
}
