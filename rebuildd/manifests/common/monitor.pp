class rebuildd::common::monitor {
	require rebuildd::params

	monitor::process { 'rebuildd_process':
		process	=> "$rebuildd::params::processname",
	}
}
