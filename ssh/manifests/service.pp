class ssh::service {
	service { 'openssh':
		name		=> $ssh::params::servicename,
		enable		=> true,
		ensure		=> running,
		hasrestart	=> true,
		hasstatus	=> $ssh::params::hasstatus,
		require		=> Class["ssh::config"],
	}
}
