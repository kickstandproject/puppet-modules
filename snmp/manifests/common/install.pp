class snmp::common::install {
	package { "$snmp::params::packagename":
		ensure	=> present,
	}
}
