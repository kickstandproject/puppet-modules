class ntp::server {
	include ntp::params
	include ntp::classes::install
	include ntp::classes::config
	include ntp::classes::service

	if $firewall == 'yes' {
		include ntp::classes::firewall
	}
}
