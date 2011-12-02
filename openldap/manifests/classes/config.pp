class openldap::classes::config {

	File {
		owner	=> "$dfl_owner",
		group	=> "$dfl_group",
		mode	=> "$dfl_mode",
	}

	file { "$openldap_staging_path":
		ensure	=> "directory",
		mode	=> 0755,
	}

	file { "$openldap_operatingsystem_slapd_config":
		ensure	=> present,
		source	=> "puppet:///modules/openldap/etc/default/slapd",
		require	=> Class["openldap::classes::install"],
		notify	=> Class["openldap::classes::service"],
	}

	file { "$openldap_slapd_conf":
		ensure	=> present,
		content	=> template('openldap/slapd.erb'),
		require	=> Class["openldap::classes::install"],
		notify	=> Class["openldap::classes::service"],
	}

	file { "$openldap_frontend_ldif":
		ensure	=> present,
		content	=> template('openldap/frontend.erb'),
	}

	file { "$openldap_initial_config_script":
		ensure	=> present,
		source	=> "puppet:///modules/openldap/initial_config.sh",
		mode	=> 0500
	}

	# This is really the better way to handle passing the passwd to ldapadd, but I can't make it work right now
	#
	file { "$openldap_rootpw_file":
		ensure	=> present,
		content	=> template('openldap/rootpw.erb'),
		require	=> Class["openldap::classes::install"],
		mode	=> 0400,
	}

	exec { "Initial LDAP Configuration":
		subscribe	=> [ Package["$packagename"], Package["$packagename_client"] ],
		refreshonly	=> true,
		cwd		=> "$openldap_staging_path",
		creates		=> "$openldap_staging_path/.ldap_initial_configuration",
		path		=> "/bin:/usr/bin",
		command		=> "$openldap_initial_config_script $ldap_rootdn $ldap_domain $ldap_plain_passwd"
	}
}
