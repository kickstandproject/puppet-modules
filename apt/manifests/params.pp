class apt::params {
	$packagename = $operatingsystem ? {
		default => 'debconf-utils',
	}

	$servicename = $operatingsystem ? {
		default => 'apt',
	}

	$processname = $operatingsystem ? {
		default => 'apt',
	}

	$hasstatus = $operatingsystem ? {
		default => true,
	}

	$configdir = $operatingsystem ? {
		default => '/etc/apt',
	}

	$configfile = $operatingsystem ? {
		default => '/etc/apt/sources.list',
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

	$aptget = $operatingsystem ? {
		default => '/usr/bin/apt-get -qq update',
	}
}
