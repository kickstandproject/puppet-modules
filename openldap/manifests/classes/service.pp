class openldap::classes::service {
	service { 'slapd':
		name		=> $openldap::params::servicename,
		enable		=> true,
		ensure		=> running,
		hasrestart	=> true,
		hasstatus	=> $openldap::params::hasstatus,
	}
}
