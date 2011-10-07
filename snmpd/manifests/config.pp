class snmpd::config {
	file { 'snmpd.conf':
                path    => $snmpd::params::configfile,
                mode    => $snmpd::params::configfile_mode,
                owner   => $snmpd::params::configfile_owner,
                group   => $snmpd::params::configfile_group,
                ensure  => present,
                require => Class["snmpd::install"],
                notify  => Class["snmpd::service"],
	}
}
