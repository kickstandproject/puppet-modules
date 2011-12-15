class openstack::glance::params {
	$packagename = $operatingsystem ? {
		default => 'glance',
	}

	$servicename = $operatingsystem ? {
		default => 'glance-registry',
	}

	$processname = $operatingsystem ? {
		default => 'glance-registry',
	}

	$hasstatus = $operatingsystem ? {
		default => true,
	}

	$configfile_registry = $operatingsystem ? {
		default => '/etc/glance/glance-registry.conf',
	}

	$configfile_mode = $operatingsystem ? {
		default => '644',
	}

	$configfile_owner = $operatingsystem ? {
		default => 'glance',
	}

	$configfile_group = $operatingsystem ? {
		default => 'glance',
	}

	$configdir = $operatingsystem ? {
		default => '/etc/glance',
	}

	$db = $openstack_glance_db ? {
		'' => 'sqlite',
		default => "$openstack_glance_db"
        }
}
