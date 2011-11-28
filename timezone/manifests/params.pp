class timezone::params {
	$packagename = $operatingsystem ? {
		default => 'tzdata',
	}

	$configfile = $operatingsystem ? {
		default => '/etc/timezone',
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

	$zone = $timezone_zoneinfo ? {
		''	=> 'America/Toronto',
		default	=> "$timezone_zone",
	}
}
