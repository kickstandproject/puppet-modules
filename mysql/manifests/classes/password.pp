class mysql::classes::password {
	require mysql::params

	file { '/root/.my.cnf':
		name	=> '/root/.my.cnf',
		mode	=> 400,
		owner	=> $mysql::params::configfile_owner,
		group	=> $mysql::params::configfile_group,
		ensure	=> present,
		content	=> template('mysql/server/my.cnf.root.erb'),
		replace => 'false',
		require => Exec['mysql_root_password'],
	}
	
	exec { 'mysql_root_password':
		subscribe	=> Class['mysql::classes::install'],
		require		=> Class['mysql::classes::service'],
		refreshonly	=> true,
		command		=> "/usr/bin/mysqladmin -uroot password '${mysql::params::db_password}'";
	}
}
