class openldap::classes::config {

	File {
		owner	=> "$openldap::params::owner",
		group	=> "$openldap::params::group",
		mode	=> "$openldap::params::mode",
	}

	file { "$openldap::params::staging_path":
		ensure	=> "directory",
		mode	=> 0755,
	}

	file { "$openldap::params::operatingsystem_slapd_config":
		ensure	=> present,
		source	=> template('openldap/slapd_config.erb'),
		require	=> Class["openldap::classes::install"],
		notify	=> Class["openldap::classes::service"],
	}

	file { "$openldap::params::slapd_conf":
		ensure	=> present,
		content	=> template('openldap/slapd.erb'),
		require	=> Class["openldap::classes::install"],
		notify	=> Class["openldap::classes::service"],
	}

	file { "$openldap::params::frontend_ldif":
		ensure	=> present,
		content	=> template('openldap/frontend.erb'),
	}

	file { "$openldap::params::initial_config_script":
		ensure	=> present,
		content	=> template('openldap/initial_config.erb'),
		mode	=> 0500
	}

	# This is really the better way to handle passing the passwd to ldapadd, but I can't make it work right now
	#
	file { "$openldap::params::rootpw_file":
		ensure	=> present,
		content	=> template('openldap/rootpw.erb'),
		require	=> Class["openldap::classes::install"],
		mode	=> 0400,
	}

	exec { "Initial LDAP Configuration":
		subscribe	=> [ Package["$openldap::params::packagename"], Package["$openldap::params::packagename_client"] ],
		refreshonly	=> true,
		cwd		=> "$openldap::params::staging_path",
		creates		=> "$openldap::params::staging_path/.ldap_initial_configuration",
		path		=> "/bin:/usr/bin",
		command		=> "$openldap::params::initial_config_script $openldap::params::rootdn $openldap::params::domain $openldap::params::plain_passwd $openldap::params::frontend_ldif"
	}
}
