class openssh::classes::config {
	file { 'sshd_config':
		name	=> $openssh::params::configfile,
		mode	=> $openssh::params::configfile_mode,
		owner	=> $openssh::params::configfile_owner,
		group	=> $openssh::params::configfile_group,
		ensure	=> present,
		content	=> template('openssh/sshd_config.erb'),
		require => Class['openssh::classes::install'],
		notify	=> Class['openssh::classes::service'],
	}
}
