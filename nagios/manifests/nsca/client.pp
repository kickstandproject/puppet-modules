class nagios::nsca::client inherits nagios::nsca::common::init {
    require nagios::params

    File {
        mode    => '0644',
        owner   => $nagios::params::configfile_owner,
        group   => $nagios::params::configfile_group,
    }

    nagios_command { 'submit_ocsp':
        ensure          => present,
        command_line    => "${nagios::params::plugindir}/submit_ocsp \$HOSTNAME\$ '\$SERVICEDESC\$' \$SERVICESTATEID\$ '\$SERVICEOUTPUT\$'",
        target          => "${nagios::params::customconfigdir}/commands/submit_ocsp.cfg",
        notify          => Class['nagios::common::service'],
	require         => File["${nagios::params::customconfigdir}/commands/submit_ocsp.cfg"],
    }

    file { "${nagios::params::customconfigdir}/commands/submit_ocsp.cfg":
        ensure  => present,
	require => File["${nagios::params::customconfigdir}/commands"],
    }

    nagios_command { 'submit_ochp':
        ensure          => present,
        command_line    => "${nagios::params::plugindir}/submit_ochp \$HOSTNAME\$ \$HOSTSTATE\$ '\$HOSTOUTPUT\$'",
        target          => "${nagios::params::customconfigdir}/commands/submit_ochp.cfg",
        notify          => Class['nagios::common::service'],
        require         => File["${nagios::params::customconfigdir}/commands/submit_ochp.cfg"],
    }

    file { "${nagios::params::customconfigdir}/commands/submit_ochp.cfg":
        ensure  => present,
	require => File["${nagios::params::customconfigdir}/commands"],
    }

    file { "${nagios::params::plugindir}/submit_ocsp":
        content => template('nagios/nsca/client/submit_ocsp.erb'),
        ensure  => present,
        mode    => '0755',
	require => File[$nagios::params::plugindir],
    }

    file { "${nagios::params::plugindir}/submit_ochp":
        content => template('nagios/nsca/client/submit_ochp.erb'),
        ensure  => present,
        mode    => '0755',
	require => File[$nagios::params::plugindir],
    }
}
