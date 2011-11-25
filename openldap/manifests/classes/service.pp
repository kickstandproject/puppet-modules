class openldap::classes::service {
	service { '$openldap::params::servicename':
		enable		=> true,
		ensure		=> running,
		hasrestart	=> true,
		hasstatus	=> $openldap::params::hasstatus,
	}
}
