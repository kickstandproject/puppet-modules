class openldap::params {
	$packagename = $operatingsystem ? {
		default => 'slapd',
	}

	$packagename_client = $operatingsystem ? {
		default => 'ldap-utils',
	}

	$servicename = $operatingsystem ? {
		default => 'slapd',
	}

	$processname = $operatingsystem ? {
		default => 'slapd',
	}

	$hasstatus = $operatingsystem ? {
		default => true,
	}

	$dfl_owner = $operatingsystem ? {
		default => 'root',
	}

	$dfl_group = $operatingsystem ? {
		default =>  'root',
	}

	$dfl_mode = $operatingsystem ? {
		default => 0644,
	}

	$openldap_staging_path = $operatingsystem ? {
		default => '/etc/puppet/modules/openldap/',
	}

	$openldap_operatingsystem_slapd_config = $operatingsystem ? {
		# TODO: this needs to be abstracted out for Ubuntu/Debian specifically
		default => '/etc/default/slapd',
	}

	$openldap_slapd_conf = $operatingsystem ? {
		default => '/etc/ldap/slapd.conf',
	}

	$openldap_frontend_ldif = $operatingsystem ? {
		default => '/etc/puppet/modules/openldap/frontend.ldif',
	}

	$openldap_initial_config_script = $operatingsystem ? {
		default => '/etc/puppet/modules/openldap/initial_config.sh',
	}

	$openldap_rootpw_file = $operatingsystem ? {
		default => '/etc/puppet/modules/openldap/.ldap_rootpw',
	}
}
