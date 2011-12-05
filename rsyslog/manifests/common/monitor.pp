class rsyslog::common::monitor {
	require rsyslog::params

	monitor::process { 'rsyslog_process':
		process	=> "$rsyslog::params::processname",
	}
}
