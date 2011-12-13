class rabbitmq::common::install {
	package { "$rabbitmq::params::packagename":
		ensure	=> present,
	}
}
