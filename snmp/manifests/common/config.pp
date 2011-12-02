class snmp::common::config {
	file { "$snmp::params::configfile":
		content	=> template('snmp/server/snmpd.conf.erb'),
                ensure  => present,
                group   => $snmp::params::configfile_group,
                mode    => $snmp::params::configfile_mode,
                notify  => Class["snmp::common::service"],
                owner   => $snmp::params::configfile_owner,
                require => Class["snmp::common::install"],
	}
}
