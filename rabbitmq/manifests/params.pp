class rabbitmq::params {
	$packagename = $operatingsystem ? {
		default => 'rabbitmq-server',
	}

	$servicename = $operatingsystem ? {
		default => 'rabbitmq-server',
	}

	$processname = $operatingsystem ? {
		default => 'rabbitmq',
	}

	$hasstatus = $operatingsystem ? {
		default => true,
	}

	$configfile = $operatingsystem ? {
		default => '/etc/rabbitmq/rabbitmq.conf',
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
		default => '/etc/rabbitmq',
	}
}
