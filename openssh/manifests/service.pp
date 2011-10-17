class openssh::service {
	service { 'openssh':
		name		=> $openssh::params::servicename,
		enable		=> true,
		ensure		=> running,
		hasrestart	=> true,
		hasstatus	=> $openssh::params::hasstatus,
		require		=> Class['openssh::config'],
	}
}
