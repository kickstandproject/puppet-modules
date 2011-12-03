class rsyslog::classes::mysql {
	require mysql::params
	if ($rsyslog::params::db_server == 'localhost') {
		include mysql::server
	}

	package { 'rsyslog-mysql':
		name		=> $rsyslog::params::packagename_mysql,
		ensure		=> present,
		responsefile	=> '/var/local/preseed/rsyslog-mysql.preseed',
		require		=> File['/var/local/preseed/rsyslog-mysql.preseed'],
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

	file { '/var/local/preseed/rsyslog-mysql.preseed':
		owner	=> root,
		group	=> root,
		mode	=> 400,
		content	=> template('rsyslog/server/rsyslog-mysql.preseed.erb'),
	}
}
