class snmp::params {
	$configdir = $operatingsystem ? {
		default => '/etc/snmp',
	}

	$configfile = $operatingsystem ? {
		default => '/etc/snmp/snmpd.conf',
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

	$hasstatus = $operatingsystem ? {
		default => false,
	}

	$packagename = $operatingsystem ? {
		default => 'snmpd',
	}

	$processname = $operatingsystem ? {
		default => 'snmp',
	}

	$servicename = $operatingsystem ? {
		default => 'snmpd',
	}
}
