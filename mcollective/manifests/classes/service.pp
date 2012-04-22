class mcollective::classes::service {
	service { 'mcollective':
		name		=> $mcollective::params::servicename,
		enable		=> true,
		ensure		=> running,
		hasrestart	=> true,
		hasstatus	=> $mcollective::params::hasstatus,
	}
}
