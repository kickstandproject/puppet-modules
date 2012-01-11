class apache::params {
	$configdir = $operatingsystem ? {
		default => '/etc/apache2',
	}

	$configfile = $operatingsystem ? {
		default => '/etc/apache2/apache2.conf',
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
		default => "$configdir/conf.d",
	}

	$defaultfile = $operatingsystem ? {
		default	=> '/etc/default/apache2',
	}

	$rootdir = $operatingsystem ? {
		default => '/var/www',
	}

	$hasstatus = $operatingsystem ? {
		default => true,
	}

	$logdir = $operatingsystem ? {
		default	=> '/var/log/apache2',
	}

	$packagename = $operatingsystem ? {
		default => 'apache2',
	}

	$processname = $operatingsystem ? {
		default => 'apache2',
	}

	$servicename = $operatingsystem ? {
		default => 'apache2',
	}

	$virtualhostdir = $operatingsystem ? {
		default => '/etc/apache2/sites-available',
	}
}
