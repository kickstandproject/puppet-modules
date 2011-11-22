class rsyslog::server {
	include rsyslog::params
	include rsyslog::classes::install
	include rsyslog::classes::config
	include rsyslog::classes::service

	if $firewall == 'yes' {
		include rsyslog::classes::firewall
	}
}
