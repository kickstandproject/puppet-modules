class timezone::classes::config {
	file { 'timezone':
		name	=> $timezone::params::configfile,
		mode	=> $timezone::params::configfile_mode,
		owner	=> $timezone::params::configfile_owner,
		group	=> $timezone::params::configfile_group,
		ensure	=> present,
		content	=> template('timezone/client/timezone.erb'),
		require => Class['timezone::classes::install'],
		notify	=> Exec['set-timezone'],
	}

	exec { 'set-timezone':
		command		=> '/usr/sbin/dpkg-reconfigure -f noninteractive tzdata',
		refreshonly	=> true,
	}
}
