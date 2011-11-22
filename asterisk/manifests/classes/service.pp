class asterisk::classes::service {
	service { 'asterisk':
		name		=> $asterisk::params::servicename,
		enable		=> true,
		ensure		=> running,
		hasrestart	=> true,
		hasstatus	=> $asterisk::params::hasstatus,
	}
}
