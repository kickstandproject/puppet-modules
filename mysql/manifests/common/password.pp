class mysql::common::password {
	# TODO: Remove hardcoded paths
	require mysql::params

	file { '/root/.my.cnf':
		content	=> template('mysql/server/my.cnf.root.erb'),
		ensure	=> present,
		group	=> $mysql::params::configfile_group,
		mode	=> 400,
		name	=> '/root/.my.cnf',
		owner	=> $mysql::params::configfile_owner,
		replace => 'false',
		require => Exec['mysql_root_password'],
	}
	
	exec { 'mysql_root_password':
		command		=> "/usr/bin/mysqladmin -uroot password '${mysql::params::db_password}'",
		subscribe	=> Class['mysql::common::install'],
		refreshonly	=> true,
		require		=> Class['mysql::common::service'],
	}
}
