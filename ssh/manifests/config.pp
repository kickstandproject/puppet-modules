class ssh::config {
	file { 'sshd_config':
		name	=> $ssh::params::configfile,
		mode	=> $ssh::params::configfile_mode,
		owner	=> $ssh::params::configfile_owner,
		group	=> $ssh::params::configfile_group,
		ensure	=> present,
		require => Class["ssh::install"],
		notify	=> Class["ssh::service"],
	}
}
