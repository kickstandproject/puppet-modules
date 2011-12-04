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
		default => 'mysqld',
	}

	$hasstatus = $operatingsystem ? {
		default => false,
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

	$bindaddr = $mysql_bindaddr ? {
		''	=> '127.0.0.1',
		default	=> "$mysql_bindaddr",
	}

	$db_user = $mysql_db_user ? {
		''	=> 'root',
		default	=> "$mysql_db_user",
	}

	$db_password = $mysql_db_password ? {
		''	=> '',
		default	=> "$mysql_db_password",
	}

	$port = $mysql_port ? {
		''	=> '3306',
		default	=> "$mysql_port",
	}
}
