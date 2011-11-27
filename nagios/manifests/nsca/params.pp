class nagios::nsca::params {
	$packagename = $operatingsystem ? {
		default => 'nsca',
	}

	$servicename = $operatingsystem ? {
		default => 'nsca',
	}

	$hasstatus = $operatingsystem ? {
		default => false,
	}

	$configfile = $operatingsystem ? {
		default => '/etc/nsca.cfg',
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
}
