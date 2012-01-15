class openssh::common::config {
	File {
		ensure	=> present,
		group	=> $openssh::params::configfile_group,
		mode	=> $openssh::params::configfile_mode,
		owner	=> $openssh::params::configfile_owner,
	}

	file { "$openssh::params::configfile":
		content	=> template('openssh/server/etc/ssh/sshd_config.erb'),
		notify	=> Class['openssh::common::service'],
		require => Class['openssh::common::install'],
	}
}
