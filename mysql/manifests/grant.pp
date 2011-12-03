define mysql::grant (
	$mysql_db,
	$mysql_user,
	$mysql_password,
	$mysql_privileges = 'ALL',
	$mysql_host = 'localhost'
	) {
	require mysql::server

	file { 'mysql_grant_file':
		mode	=> 600,
		owner	=> root,
		group	=> root,
		path	=> '/root/blah.sql',
		content	=> template('mysql/grant.erb'),
		replace	=> false,
	}

	exec { 'bobobo':
		command		=> '/usr/bin/mysql --defaults-file=/root/.my.cnf -uroot < /root/blah.sql',
		require		=> Class['mysql::classes::service'],
		subscribe	=> File['/root/blah.sql'],
		refreshonly	=> true,
	}
}
