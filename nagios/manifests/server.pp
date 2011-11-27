class nagios::server inherits nagios::common::init {
	if ($firewall == 'yes') {
		include nagios::common::firewall
	}
}
