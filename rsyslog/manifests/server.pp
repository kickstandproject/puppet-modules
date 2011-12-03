class rsyslog::server inherits rsyslog::common::init {
	if ($firewall == 'yes') {
		include rsyslog::common::firewall
	}

	if ($rsyslog::params::db == 'mysql') {
		include rsyslog::common::mysql
	}
}
