class nagios::nsca::params {
	$configfile = $operatingsystem ? {
		default => '/etc/nsca.cfg',
	}

	$configfile_client = $operatingsystem ? {
		default => '/etc/send_nsca.cfg',
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

	$hasstatus = $operatingsystem ? {
		default => false,
	}

	$packagename = $operatingsystem ? {
		default => 'nsca',
	}

	$server = $nagios_nsca_server ? {
		''	=> 'localhost',
		default	=> $nagios_nsca_server,
	}

	$servicename = $operatingsystem ? {
		default => 'nsca',
	}
}
