class mysql::common::config {
	file { "$mysql::params::configfile":
		content	=> template('mysql/server/my.cnf.erb'),
		ensure	=> present,
		group	=> $mysql::params::configfile_group,
		mode	=> $mysql::params::configfile_mode,
		notify	=> Class['mysql::common::service'],
		owner	=> $mysql::params::configfile_owner,
		require => Class['mysql::common::install'],
	}
}
