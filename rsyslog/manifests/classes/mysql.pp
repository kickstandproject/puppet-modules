class rsyslog::classes::mysql {
	include mysql::server

	package { 'rsyslog-mysql':
		name    => $rsyslog::params::packagename_mysql,
		ensure  => present,
	}

	file { 'rsyslog.mysql':
		name	=> "$rsyslog::params::configdir/mysql.conf",
		mode	=> $rsyslog::params::configfile_mode,
		owner	=> $rsyslog::params::configfile_owner,
		group	=> $rsyslog::params::configfile_group,
		ensure	=> present,
		content => template('rsyslog/server/mysql.conf.erb'),
		require => Class['rsyslog::classes::install'],
		notify	=> Class['rsyslog::classes::service'],
	}
}
