class mysql::params {
	$packagename = $operatingsystem ? {
		default => 'mysql-server',
	}

	$packagename_client = $operatingsystem ? {
		default => 'mysql',
	}

	$servicename = $operatingsystem ? {
		default => 'mysql',
	}

	$processname = $operatingsystem ? {
		default => 'mysql',
	}

	$hasstatus = $operatingsystem ? {
		default => true,
	}

	$configfile = $operatingsystem ? {
		default => '/etc/mysql/my.cnf',
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
		default => '/etc/mysql/conf.d',
	}

	$db_password = $mysql_db_password ? {
		''	=> '',
		default	=> "$mysql_db_password",
	}
}
