define nagios::service::nsca (
    $check_command = false,
    $description,
    $ensure = 'present',
    $server,
    $use_active = 'generic-service-active',
    $use_passive = 'generic-service-passive'
) {
    require nagios::client
    include nagios::params

    $fname = regsubst($name, "\W", "_", "G")

    nagios::service::local { $name:
        ensure          => $ensure,
        check_command   => $check_command,
        description     => $description,
        hostgroup_name  => 'all',
        use             => $use_active,
    }

    @@nagios_service { "@@${name} on ${hostname}":
        ensure              => $ensure,
        host_name           => $fqdn,
        notify              => Class['nagios::common::service'],
        service_description => $description,
        tag                 => $server,
        target              => "${nagios::params::configdir}/services/passive/${fname}.on.${hostname}.cfg",
        use                 => $use_passive,
    }

    @@file { "${nagios::params::configdir}/services/passive/${fname}.on.${hostname}.cfg":
        ensure  => $ensure,
        group   => $nagios::params::configfile_group,
        mode    => $nagios::params::configfile_mode,
        owner   => $nagios::params::configfile_owner,
        tag     => $server,
    }
}
