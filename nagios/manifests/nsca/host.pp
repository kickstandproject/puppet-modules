define nagios::nsca::host(
    $address = false,
    $ensure = present,
    $server, 
    $use_active = 'generic-host-active',
    $use_passive = 'generic-host-passive'
    ) {
    require nagios::client

    nagios_host { $name:
        address => $address ? {
            false   => $ipaddress,
            default => $address,
        },
        ensure  => $ensure,
        notify  => Class['nagios::common::service'],
        target  => "${nagios::params::configdir}/hosts/${name}.cfg",
        use     => $use_active,
    }

    file { "${nagios::params::configdir}/hosts/${name}.cfg":
        ensure  => $ensure,
        mode    => $nagios::params::configfile_mode,
        owner   => $nagios::params::configfile_owner,
        group   => $nagios::params::configfile_group,
        before  => Nagios_host[$name],
    }

    @@nagios_host { "@@${name}":
        address     => $address ? {
            false   => $ipaddress,
            default => $address,
        },
        alias       => $name,
        ensure      => $ensure,
        host_name   => $name,
        notify      => Class['nagios::common::service'],
        tag         => $server,
        target      => "${nagios::params::configdir}/hosts/passive-${name}.cfg",
        use         => $use_passive,
    }

    @@file { "${nagios::params::configdir}/hosts/passive-${name}.cfg":
        ensure  => $ensure,
        group   => $nagios::params::configfile_group,
        mode    => $nagios::params::configfile_mode,
        owner   => $nagios::params::configfile_owner,
        tag     => $server,
    }
}
