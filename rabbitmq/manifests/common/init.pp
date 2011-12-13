class rabbitmq::common::init {
	include rabbitmq::params
	include rabbitmq::common::install
	include rabbitmq::common::config
	include rabbitmq::common::service

	if ($monitor == 'yes') {
		include rabbitmq::common::monitor
	}
}
