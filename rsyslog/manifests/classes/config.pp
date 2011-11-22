class rsyslog::classes::config {
	file { 'rsyslog.conf':
		name	=> $rsyslog::params::configfile,
		mode	=> $rsyslog::params::configfile_mode,
		owner	=> $rsyslog::params::configfile_owner,
		group	=> $rsyslog::params::configfile_group,
		ensure	=> present,
		content	=> template('rsyslog/rsyslog.conf.erb'),
		require => Class['rsyslog::classes::install'],
		notify	=> Class['rsyslog::classes::service'],
	}
}
