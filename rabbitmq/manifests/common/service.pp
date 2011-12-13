class rabbitmq::common::service {
	service { "$rabbitmq::params::servicename":
		enable		=> true,
		ensure		=> running,
		hasrestart	=> true,
		hasstatus	=> $rabbitmq::params::hasstatus,
		require		=> Class['rabbitmq::common::config'],
	}
}
