class snmpd::service {
	service { 'snmpd':
		name		=> $snmpd::params::servicename,
		enable		=> true,
		ensure		=> running,
		hasrestart	=> true,
		hasstatus	=> $snmpd::params::hasstatus,
		require		=> Class['snmpd::config'],
	}
}
