class mysql::classes::config {
	file { 'mysql.conf':
		name	=> $mysql::params::configfile,
		mode	=> $mysql::params::configfile_mode,
		owner	=> $mysql::params::configfile_owner,
		group	=> $mysql::params::configfile_group,
		ensure	=> present,
		content	=> template('mysql/server/my.cnf.erb'),
		require => Class['mysql::classes::install'],
		notify	=> Class['mysql::classes::service'],
	}
}
