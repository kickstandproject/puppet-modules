class pbuilder::params {
	$cachedir = $operatingsystem ? {
		default => '/var/cache/pbuilder',
	}

	$components = $pbuilder_components ? {
		''	=> 'main restricted universe',
		default	=> "$pbuilder_components",
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

	$mirror = $pbuilder_mirror ? {
		''	=> 'archive.ubuntu.com',
		default => "$pbuilder_mirror",
	}

	$packagename = $operatingsystem ? {
		default => 'pbuilder',
	}

	$releases = $pbuilder_releases ? {
		''	=> 'precise',
		default	=> "$pbuilder_releases",
	}
}
