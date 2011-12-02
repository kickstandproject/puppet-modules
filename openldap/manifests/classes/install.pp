class openldap::classes::install {

	if defined(Class['openldap::server']) {
		package { "$openldap::params::packagename":
			ensure	=> present,
		}
	}

	package { '$openldap::params:packagename_client':
		ensure	=> present,
	}
}
