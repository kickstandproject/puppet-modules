class asterisk::params {
	$packagename = $operatingsystem ? {
		default => 'asterisk',
	}

	$servicename = $operatingsystem ? {
		default => 'asterisk',
	}

	$processname = $operatingsystem ? {
		default => 'asterisk',
	}

	$hasstatus = $operatingsystem ? {
		default => true,
	}

	$configfile = $operatingsystem ? {
		default => '/etc/asterisk/asterisk.conf',
	}

	$configfile_mode = $operatingsystem ? {
		default => '640',
	}

	$configfile_owner = $operatingsystem ? {
		default => 'asterisk',
	}

	$configfile_group = $operatingsystem ? {
		default => 'asterisk',
	}

	$configdir = $operatingsystem ? {
		default => '/etc/asterisk',
	}
}
