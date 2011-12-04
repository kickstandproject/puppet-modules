class asterisk::common::rsyslog {
	include rsyslog::client

	file { "$rsyslog::params::configdir/99-asterisk.conf":
		content => template('asterisk/99-asterisk.conf.erb'),
		ensure  => present,
		group   => $rsyslog::params::configfile_group,
		mode    => $rsyslog::params::configfile_mode,
		notify  => Class['rsyslog::common::service'],
		owner   => $rsyslog::params::configfile_owner,
		require => Class['rsyslog::client'],
	}
}
