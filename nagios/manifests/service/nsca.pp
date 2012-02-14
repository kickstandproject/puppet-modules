define nagios::service::nsca (
	check_command = false,
	$description,
	$ensure = present,
	$server,
	$use_active = 'generic-service-active',
	$use_passive = 'generic-service-passive'
	) {
	require nagios::params

	$fname = regsubst($name, "\W", "_", "G")

	nagios::service::local { $name:
		check_command	=> $check_command,
		description	=> $description,
		ensure		=> $ensure,
		hostgroup_name	=> 'all',
		use		=> $use_active,
	}

	@@nagios_service { "@@$name on $hostname":
		service_description	=> $description,
		ensure			=> $ensure,
		host_name		=> "$fqdn",
		notify			=> Class['nagios::common::service'],
		target			=> "$nagios::params::configdir/services/passive/$fname.on.$hostname.cfg",
		tag			=> $server,
		use			=> $use_passive,
	}

	@@file { "$nagios::params::configdir/services/passive/$fname.on.$hostname.cfg":
		ensure	=> $ensure,
		group	=> $nagios::params::configfile_group,
		mode	=> $nagios::params::configfile_mode,
		owner	=> $nagios::params::configfile_owner,
		tag	=> $server,
	}
}
