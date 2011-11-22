class rsyslog::params {
	$packagename = $operatingsystem ? {
		default => 'rsyslog',
	}

	$servicename = $operatingsystem ? {
		default => 'rsyslog',
	}

	$processname = $operatingsystem ? {
		default => 'syslog',
	}

	$hasstatus = $operatingsystem ? {
		default => true,
	}

	$configfile = $operatingsystem ? {
		default => '/etc/rsyslog.conf',
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
		default => '/etc/rsyslog.d',
	}
}
