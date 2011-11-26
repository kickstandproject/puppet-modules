class nagios::server inherits nagios::classes::common {
	if ($firewall == 'yes') {
		include nagios::classes::firewall
	}
}
