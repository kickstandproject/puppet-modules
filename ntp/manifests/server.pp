class ntp::server inherits ntp::common::init {
	if ($firewall == 'yes') {
		include ntp::common::firewall
	}

	if ($monitor == 'yes') {
		include ntp::common::monitor
	}
}
