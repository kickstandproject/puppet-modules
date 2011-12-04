class mysql::common::monitor {
	require mysql::params

	monitor::process { 'mysql_process':
		process	=> "$mysql::params::processname",
	}
}
