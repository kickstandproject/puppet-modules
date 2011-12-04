class puppet::params {
	$packagename = $operatingsystem ? {
		default => 'puppetmaster',
	}

	$packagename_client = $operatingsystem ? {
		default => 'puppet',
	}

	$servicename = $operatingsystem ? {
		default => 'puppet',
	}

	$processname = $operatingsystem ? {
		default => 'root',
	}

	$hasstatus = $operatingsystem ? {
		default => true,
	}

	$configfile = $operatingsystem ? {
		default => '/etc/puppet/puppet.conf',
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
		default => '/etc/puppet',
	}

	$defaultsfile = $operatingsystem ? {
		default => '/etc/default/puppet',
	}

	$server	= $puppet_server ? {
		''	=> 'puppet',
		default	=> $puppet_server,
	}
}
