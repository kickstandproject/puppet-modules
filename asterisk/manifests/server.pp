class asterisk::server {
	class { 'asterisk::classes::ppa': stage => pre-main }
	class { 'asterisk::params': stage => main }
	class { 'asterisk::classes::install': stage => main }
	class { 'asterisk::classes::service': stage => main }

	if $firewall == 'yes' {
		include asterisk::classes::firewall
	}

	if ($rsyslog_server) {
		include asterisk::classes::rsyslog
	}
}
