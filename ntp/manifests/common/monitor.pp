class ntp::common::monitor {
	include ntp::params

	monitor::process { 'ntp_process':
		process	=> "$ntp::params::processname",
	}
}
