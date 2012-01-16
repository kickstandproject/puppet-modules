class rebuildd::params {
	$configdir = $operatingsystem ? {
		default => '/etc/rebuildd',
	}

	$configfile = $operatingsystem ? {
		default => '/etc/rebuildd/rebuilddrc',
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

	$defaultsfile = $operatingsystem ? {
		default => '/etc/default/rebuildd',
	}

	$distributions = $rebuildd_distributions ? {
		''	=> [
			'precise', 'precise-proposed',
			],
		default	=> "$rebuildd_distributions",
	}

	$email = $rebuildd_email ? {
		''	=> 'rebuildd@localhost',
		default	=> "$rebuildd_email",
	}

	$hasrestart = $operatingsystem ? {
		default => false,
	}

	$hasstatus = $operatingsystem ? {
		default => false,
	}

	$packagename = $operatingsystem ? {
		default => 'rebuildd',
	}

	$processname = $operatingsystem ? {
		default => 'rebuildd',
	}

	$servicename = $operatingsystem ? {
		default => 'rebuildd',
	}
}
