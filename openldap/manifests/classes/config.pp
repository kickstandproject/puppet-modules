class openldap::classes::config {

	File {
		owner	=> "root",
		group	=> "root",
		mode	=> 0644,
	}

	file { "/etc/puppet/modules/openldap":
		ensure	=> "directory",
		mode	=> 0755,
	}

	file { "/etc/default/slapd":
		ensure	=> present,
		source	=> "puppet:///modules/openldap/etc/default/slapd",
		require	=> Class["openldap::classes::install"],
		notify	=> Class["openldap::classes::service"],
	}

	file { "/etc/ldap/slapd.conf":
		ensure	=> present,
		content	=> template('openldap/slapd.erb'),
		require	=> Class["openldap::classes::install"],
		notify	=> Class["openldap::classes::service"],
	}

	file { "/etc/puppet/modules/openldap/frontend.ldif":
		ensure	=> present,
		content	=> template('openldap/frontend.erb'),
	}

	file { "/etc/puppet/modules/openldap/initial_config.sh":
		ensure	=> present,
		source	=> "puppet:///modules/openldap/initial_config.sh",
		mode	=> 0500
	}

	# This is really the better way to handle passing the passwd to ldapadd, but I can't make it work right now
	#
	file { "/etc/puppet/modules/openldap/.ldap_rootpw":
		ensure	=> present,
		content	=> template('openldap/rootpw.erb'),
		require	=> Class["openldap::classes::install"],
		mode	=> 0400,
	}

	exec { "Initial LDAP Configuration":
		subscribe	=> [ Package["slapd"], Package["ldap-utils"] ],
		refreshonly	=> true,
		cwd		=> "/etc/puppet/modules/openldap",
		creates		=> "/etc/puppet/modules/openldap/.ldap_initial_configuration",
		path		=> "/bin:/usr/bin",
		command		=> "/etc/puppet/modules/openldap/initial_config.sh $ldap_rootdn $ldap_domain $ldap_plain_passwd"
	}
}
