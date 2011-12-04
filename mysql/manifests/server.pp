class mysql::server inherits mysql::common::init {
	if ($firewall == 'yes') {
		include mysql::common::firewall
	}

	if ($mysql::params::db_password != '') {
		include mysql::common::password
	}
}
