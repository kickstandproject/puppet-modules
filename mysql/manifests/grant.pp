define mysql::grant (
	$mysql_db,
	$mysql_user,
	$mysql_password,
	$mysql_privileges = 'ALL',
	$mysql_host = 'localhost',
	) {
	require mysql

	file { 'mysql_grant_file':
		mode	=> 600,
		owner	=> root,
		group	=> root,
		path	=> '/root/blah.sql',
		content	=> template('mysql/grant.erb'),
		replace	=> false,
	}

	exec { 'bobobo':
		command		=> '/usr/bin mysql --default-file=/root/.mycnf -uroot < /root/blah.sql',
		require		=> Class['mysql::service'],
		subscribe	=> File['/tmp/blah.sql'],
		refreshonly	=> true,
	}
}
