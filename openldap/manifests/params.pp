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

	$owner = $operatingsystem ? {
		default => 'root',
	}

	$group = $operatingsystem ? {
		default =>  'root',
	}

	$mode = $operatingsystem ? {
		default => 0644,
	}

	$slapd_config = $operatingsystem ? {
		default => '/etc/ldap/slapd.conf',
	}

	$slapd_user = $operatingsystem ? {
		default => 'openldap',
	}

	$slapd_group = $operatingsystem ? {
		default => 'openldap',
	}

	$slapd_sentinel_file = $operatingsystem ? {
		default => '/etc/ldap/noslapd',
	}

	$slapd_pidfile = $operatingsystem ? {
		default => '/var/run/slapd.pid',
	}

	$openldap_staging_path = $operatingsystem ? {
		default => '/etc/puppet/modules/openldap/',
	}

	$openldap_schema_path = $operatingsystem ? {
		default => '/etc/ldap/schema/',
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

	# Domain for the server. Replace .example_domain.lan as dc=example_domain,dc=lan
	$openldap_domain = $operatingsystem ? {
		default => 'dc=example_domain,dc=lan',
	}

	# Left-most top level domain
	$openldap_dc = $operatingsystem ? {
		default => 'example_domain',
	}

	# Root Admin Username
	$openldap_rootdn = $operatingsystem ? {
		default => 'admin',
	}

	# Root Admin Password Created With 'slappasswd'
	$openldap_rootpw = $operatingsystem ? {
		default => '{SSHA}JK+xflJwRZY7mOh8XHLGsBoiLBGpUJPA',
	}

	# Root Admin Password In Plaintext (Required for now for ldapadd)
	$openldap_plain_passwd = $operatingsystem ? {
		default => 'welcome',
	}

	# Organization Name
	$openldap_organization = $operatingsystem ? {
		default => 'Example Industries Ltd',
	}

	# Server Description
	$openldap_description = $operatingsystem ? {
		default => 'EI Ltd LDAP Server',
	}

	# Administration User Description
	$openldap_admin_description = $operatingsystem ? {
		default => 'LDAP Administrator',
	}

        # Administration Password (only used for initial schema import)
        $openldap_admin_passwd = $operatingsystem ? {
		default => 'welcome',
	}
}
