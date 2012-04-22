class openldap::params {
	$packagename = $::operatingsystem ? {
		default => 'slapd',
	}

	$packagename_client = $::operatingsystem ? {
		default => 'ldap-utils',
	}

	$servicename = $::operatingsystem ? {
		default => 'slapd',
	}

	$processname = $::operatingsystem ? {
		default => 'slapd',
	}

	$hasstatus = $::operatingsystem ? {
		default => true,
	}
}
