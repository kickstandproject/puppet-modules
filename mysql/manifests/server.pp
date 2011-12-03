class mysql::server {
	include mysql::params
	include mysql::classes::install
	include mysql::classes::config
	include mysql::classes::service

	if ($firewall == 'yes') {
		include mysql::classes::firewall
	}

	if ($mysql::params::db_password != '') {
		include mysql::classes::password
	}
}
