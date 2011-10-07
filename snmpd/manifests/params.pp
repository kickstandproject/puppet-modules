class snmpd::params {
	$packagename = $operatingsystem ? {
		default => 'snmpd',
	}

	$servicename = $operatingsystem ? {
		default => 'snmpd',
	}

	$processname = $operatingsystem ? {
		default => 'snmpd',
	}

	$hasstatus = $operatingsystem ? {
		default => true,
	}

	$configfile = $operatingsystem ? {
		default => '/etc/snmp/snmpd.conf',
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
		default => '/etc/snmp',
	}
}
