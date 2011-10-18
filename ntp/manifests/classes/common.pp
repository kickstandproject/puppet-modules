class ntp::classes::common {
	include ntp::params
	include ntp::classes::install
	include ntp::classes::config
	include ntp::classes::service
}
