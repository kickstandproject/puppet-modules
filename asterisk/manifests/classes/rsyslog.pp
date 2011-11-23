class asterisk::classes::rsyslog {
	include rsyslog::client

	file { '99-asterisk.conf':
		name    => "$rsyslog::params::configdir/99-asterisk.conf",
		mode    => $rsyslog::params::configfile_mode,
		owner   => $rsyslog::params::configfile_owner,
		group   => $rsyslog::params::configfile_group,
		ensure  => present,
		content => template('asterisk/99-asterisk.conf.erb'),
		require => Class['rsyslog::client'],
		notify  => Class['rsyslog::classes::service'],
	}

}
