class pbuilder::params {
	$cachedir = $operatingsystem ? {
		default => '/var/cache/pbuilder',
	}

	$configdir = $operatingsystem ? {
		default => '/etc/pbuilder',
	}

	$configfile = $operatingsystem ? {
		default => '/etc/pbuilderrc',
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

	$localbindir = $operatingsystem ? {
		default	=> '/usr/local/bin',
	}

	$packagename = $operatingsystem ? {
		default => 'pbuilder',
	}
}
