class rsyslog::server inherits rsyslog::classes::common {
	if ($firewall == 'yes') {
		include rsyslog::classes::firewall
	}

	if ($rsyslog::params::db == 'mysql') {
		include rsyslog::classes::mysql
	}
}
