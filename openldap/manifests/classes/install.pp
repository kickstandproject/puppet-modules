class openldap::classes::install {

	if defined(Class['openldap::server']) {
		package { "$openldap::params::packagename":
			name	=> $openldap::params::packagename,
			ensure	=> present,
		}
	}

	package { 'ldap-utils':
		name	=> $openldap::params::packagename_client,
		ensure	=> present,
	}
}
