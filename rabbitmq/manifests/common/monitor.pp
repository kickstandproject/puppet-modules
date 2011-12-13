class rabbitmq::common::monitor {
	require rabbitmq::params

	monitor::process { 'rabbitmq_process':
		process	=> "$rabbitmq::params::processname",
	}
}
