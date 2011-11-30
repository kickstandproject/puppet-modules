class nagios::params {
	$configdir = $operatingsystem ? {
		default => '/etc/nagios3',
	}

	$configfile = $operatingsystem ? {
		default => '/etc/nagios3/nagios.cfg',
	}

	$configfile_group = $operatingsystem ? {
		default => 'root',
	}

	$configfile_mode = $operatingsystem ? {
		default => '644',
	}

	$configfile_owner = $operatingsystem ? {
		default => 'root',
	}

	$customconfigdir = $operatingsystem ? {
		default => "$configdir/puppet.d",
	}

	$hasstatus = $operatingsystem ? {
		default => true,
	}

	$hostgroups = $nagios_hostgroups ? {
		''	=> 'all',
		default	=> $nagios_hostgroup,
	}

	$packagename = $operatingsystem ? {
		default => 'nagios3-core',
	}

	$processname = $operatingsystem ? {
		default => 'nagios',
	}

	$servicename = $operatingsystem ? {
		default => 'nagios3',
	}

	$plugindir = $operatingsystem ? {
		default => '/usr/lib/nagios/plugins',
        }
}
