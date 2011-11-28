define nagios::service::nsca (
	$check_command,
	$description,
	$ensure = present,
	$server,
	$use_active = 'generic-service-active',
	$use_passive = 'generic-service-passive'
	) {

	nagios::service::local { $name:
		check_command	=> $check_command,
		description	=> $description,
		ensure		=> $ensure,
		host_name	=> $host_name ? {
			false	=> $hostname,
			default	=> $host_name,
		},
#		server		=> $server,
		use		=> $use_active,
	}
}
