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
		default => 'root',
	}

	$configfile_group = $operatingsystem ? {
		default => 'root',
	}

	$configdir = $operatingsystem ? {
		default => '/etc/glance',
	}

	$db = $openstack_glance_db ? {
		''	=> 'sqlite',
		default => "$openstack_glance_db"
        }

	$db_name = $openstack_glance_db_name ? {
		''	=> 'glance',
		default	=> "$openstack_glance_db_name",
	}

	$db_password = $openstack_glance_db_password ? {
		''	=> 'bob',
		default	=> "$openstack_glance_db_password",
	}

	$db_server = $openstack_glance_db_server ? {
		''	=> 'localhost',
		default	=> "$openstack_glance_db_server",
	}

	$db_user = $openstack_glance_db_user ? {
		''	=> 'glancedbadmin',
		default	=> "$openstack_glance_db_user",
	}

	$python_mysqldb = $operatingsystem ? {
		default	=> "python-mysqldb",
	}
}
