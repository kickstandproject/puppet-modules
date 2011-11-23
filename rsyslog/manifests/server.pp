class rsyslog::server inherits rsyslog::classes::common {
	if $firewall == 'yes' {
		include rsyslog::classes::firewall
	}
}
