class rsyslog::classes::common {
	include rsyslog::params
	include rsyslog::classes::install
	include rsyslog::classes::config
	include rsyslog::classes::service
}
