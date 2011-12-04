class openssh::common::config {
	file { "$openssh::params::configfile":
		content	=> template('openssh/sshd_config.erb'),
		ensure	=> present,
		group	=> $openssh::params::configfile_group,
		mode	=> $openssh::params::configfile_mode,
		notify	=> Class['openssh::common::service'],
		owner	=> $openssh::params::configfile_owner,
		require => Class['openssh::common::install'],
	}
}
