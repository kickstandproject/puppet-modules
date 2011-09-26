class ntp::params {
	case $operatingsystem {
		Ubuntu: {
			$ntp_package_name = 'ntp'
			$ntp_config_name = '/etc/ntp.conf'
			$ntp_service_name = 'ntp'
		}
	}
}
