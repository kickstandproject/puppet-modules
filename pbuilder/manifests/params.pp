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

	$distributions = $pbuilder_distributions ? {
		''	=> 'precise',
		default	=> "$pbuilder_distributions",
	}

	/* XXX TODO common module? */
	$localbindir = $operatingsystem ? {
		default	=> '/usr/local/bin',
	}

	$mirror = $pbuilder_mirror ? {
		''	=> 'archive.ubuntu.com',
		default => "$pbuilder_mirror",
	}

	$mirror_protocol = $pbuilder_mirror_protocol ? {
		''	=> 'http://',
		default => "$pbuilder_mirror_protocol",
	}

	$packagename = $operatingsystem ? {
		default => 'pbuilder',
	}
}
