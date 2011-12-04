class rsyslog::common::init {
	include rsyslog::params
	include rsyslog::common::install
	include rsyslog::common::config
	include rsyslog::common::service
}
