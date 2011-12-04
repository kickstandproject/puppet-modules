class asterisk::server inherits asterisk::common::init {
	if ($monitor == 'yes') {
		include asterisk::common::monitor
	}

	if ($firewall == 'yes') {
		include asterisk::common::firewall
	}

	if ($rsyslog_server) {
		include asterisk::common::rsyslog
	}
}
