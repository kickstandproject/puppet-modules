class snmpd::install {
	package { 'snmpd':
		name	=> $snmpd::params::packagename,
		ensure	=> present,
	}
}
