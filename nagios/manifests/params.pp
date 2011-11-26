class nagios::params {
	$packagename = $operatingsystem ? {
		default => 'nagios3-core',
	}

	$packagename_client = $operatingsystem ? {
		default => 'nsca',
	}

	$servicename = $operatingsystem ? {
		default => 'nagios3',
	}

	$processname = $operatingsystem ? {
		default => 'nagios3',
	}

	$hasstatus = $operatingsystem ? {
		default => true,
	}

	$configfile = $operatingsystem ? {
		default => '/etc/nagios3/nagios.cfg',
	}

	$configfile_mode = $operatingsystem ? {
		default => '644',
	}

	$configfile_owner = $operatingsystem ? {
		default => 'root',
	}

	$configfile_group = $operatingsystem ? {
		default => 'root',
	}

	$configdir = $operatingsystem ? {
		default => '/etc/nagios3',
	}
}
