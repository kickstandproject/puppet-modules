class openssh::params {
	$packagename = $operatingsystem ? {
		default => 'openssh-server',
	}

	$servicename = $operatingsystem ? {
		default => 'ssh',
	}

	$processname = $operatingsystem ? {
		default => 'sshd',
	}

	$hasstatus = $operatingsystem ? {
		default => true,
	}

	$configfile = $operatingsystem ? {
		default => '/etc/ssh/sshd_config',
	}

	$configfile_mode = $operatingsystem ? {
		default => '600',
	}

	$configfile_owner = $operatingsystem ? {
		default => 'root',
	}

	$configfile_group = $operatingsystem ? {
		default => 'root',
	}

	$configdir = $operatingsystem ? {
		default => '/etc/ssh',
	}
}
