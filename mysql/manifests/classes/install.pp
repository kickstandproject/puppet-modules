class mysql::classes::install {
	package { 'mysql-server':
		name	=> $mysql::params::packagename,
		ensure	=> present,
	}
}
