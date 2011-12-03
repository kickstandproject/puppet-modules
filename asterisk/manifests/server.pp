class asterisk::server {
	include asterisk::params
	include asterisk::classes::install
	include asterisk::classes::service

	if ($monitor == 'yes') {
		include asterisk::classes::monitor
	}

	if ($firewall == 'yes') {
		include asterisk::classes::firewall
	}

	if ($rsyslog_server) {
		include asterisk::classes::rsyslog
	}
}
