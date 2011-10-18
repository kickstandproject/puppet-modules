class ntp::server inherits ntp::classes::common {
	if $firewall == 'yes' {
		include ntp::classes::firewall
	}
}
