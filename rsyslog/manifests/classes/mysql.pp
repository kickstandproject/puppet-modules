class rsyslog::classes::mysql {
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

	include mysql::server

	mysql::grant { 'blahaa':
		mysql_db		=> "$rsyslog::params::db_name",
		mysql_host		=> "$rsyslog::params::db_server",
		mysql_password		=> "$rsyslog::params::db_password",
		mysql_privileges	=> 'ALL',
		mysql_user		=> "$rsyslog::params::db_user",
		notify			=> Class['rsyslog::classes::service'],
	}
}
