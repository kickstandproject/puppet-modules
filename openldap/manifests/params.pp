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

	$configfile = $openldap_configfile ? {
		''	=> '/etc/ldap/slapd.conf',
		default => $openldap_configfile,
	}

	$slapd_user = $openldap_slapd_user ? {
		''	=> 'openldap',
		default	=> $openldap_slapd_user,
	}

	$slapd_group = $openldap_slapd_group ? {
		''	=> 'openldap',
		default	=> $openldap_slapd_group,
	}

	$slapd_sentinel_file = $openldap_slapd_sentinal_file ? {
		''	=> '/etc/ldap/noslapd',
		default	=> $openldap_slapd_sentinal_file,
	}

	$slapd_pidfile = $openldap_slapd_pidfile ? {
		''	=> '/var/run/slapd.pid',
		default	=> $openldap_slapd_pidfile,
	}

	$staging_path = $openldap_staging_path ? {
		''	=> '/etc/puppet/modules/openldap/',
		default	=> $openldap_staging_path,
	}

	$schema_path = $openldap_schema_path ? {
		''	=> '/etc/ldap/schema/',
		default	=> $openldap_schema_path,
	}

	$operatingsystem_slapd_config = $openldap_operatingsystem_slapd_config ? {
		# TODO: this needs to be abstracted out for Ubuntu/Debian specifically
		''	=> '/etc/default/slapd',
		default	=> $openldap_operatingsystem_slapd_config,
	}

	$frontend_ldif = $openldap_frontend_ldif ? {
		''	=> '/etc/puppet/modules/openldap/frontend.ldif',
		default	=> $openldap_frontend_ldif,
	}

	$initial_config_script = $openldap_initial_config_script ? {
		''	=> '/etc/puppet/modules/openldap/initial_config.sh',
		default	=> $openldap_initial_config_script,
	}

	$rootpw_file = $openldap_rootpw_file ? {
		''	=> '/etc/puppet/modules/openldap/.ldap_rootpw',
		default	=> $openldap_rootpw_file,
	}

	# Domain for the server. Replace .example_domain.lan as dc=example_domain,dc=lan
	$domain = $openldap_domain ? {
		''	=> 'dc=example_domain,dc=lan',
		default	=> $openldap_domain,
	}

	# Left-most top level domain
	$dc = $openldap_dc ? {
		''	=> 'example_domain',
		default	=> $openldap_dc,
	}

	# Root Admin Username
	$rootdn = $openldap_rootdn ? {
		''	=> 'admin',
		default	=> $openldap_rootdn,
	}

	# Root Admin Password Created With 'slappasswd'
	$rootpw = $openldap_rootpw ? {
		''	=> '{SSHA}JK+xflJwRZY7mOh8XHLGsBoiLBGpUJPA',
		default	=> $openldap_rootpw,
	}

	# Root Admin Password In Plaintext (Required for now for ldapadd)
	$plain_passwd = $openldap_plain_passwd ? {
		''	=> 'welcome',
		default	=> $openldap_plain_passwd,
	}

	# Organization Name
	$organization = $openldap_organization ? {
		''	=> 'Example Industries Ltd',
		default	=> $openldap_organization,
	}

	# Server Description
	$description = $openldap_description ? {
		''	=> 'EI Ltd LDAP Server',
		default	=> $openldap_description,
	}

	# Administration User Description
	$admin_description = $openldap_admin_description ? {
		''	=> 'LDAP Administrator',
		default	=> $openldap_admin_description,
	}

        # Administration Password (only used for initial schema import)
        $admin_passwd = $openldap_admin_passwd ? {
		''	=> 'welcome',
		default	=> $openldap_admin_passwd,
	}
}
