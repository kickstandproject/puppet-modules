class rabbitmq::common::install {
    require rabbitmq::params

	package { $rabbitmq::params::packagename:
		ensure	=> present,
	}
}
