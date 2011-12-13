class openstack::glance::params {
	$packagename = $operatingsystem ? {
		default => 'glance',
	}

	$servicename = $operatingsystem ? {
		default => 'glance-api',
	}

	$processname = $operatingsystem ? {
		default => 'glance-api',
	}

	$hasstatus = $operatingsystem ? {
		default => true,
	}

	$configfile = $operatingsystem ? {
		default => '/etc/glance/glance-api.conf',
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
		default => '/etc/glance',
	}
}
