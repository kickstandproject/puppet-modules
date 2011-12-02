class snmp::common::service {
	require snmp::params

	service { "$snmp::params::servicename":
		enable		=> true,
		ensure		=> running,
		hasrestart	=> true,
		hasstatus	=> $snmp::params::hasstatus,
		require		=> Class['snmp::common::config'],
	}
}
