class mysql::server inherits mysql::common::init {
	if ($firewall == 'yes') {
		include mysql::common::firewall
	}

	if ($monitor == 'yes') {
		include mysql::common::monitor
	}

	if ($mysql::params::db_password != '') {
		include mysql::common::password
	}
}
