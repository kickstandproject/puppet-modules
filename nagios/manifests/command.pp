define nagios::command(
    $ensure = present,
    $command_line
    ) {
    include nagios::params

    nagios_command { $name:
        command_line    => $command_line,
        ensure      => $ensure,
        notify      => Class['nagios::common::service'],
        target      => "${nagios::params::customconfigdir}/commands/${name}.cfg",
    }

    file { "${nagios::params::customconfigdir}/commands/${name}.cfg":
        before  => Nagios_command[$name],
        ensure  => $ensure,
        group   => $nagios::params::group,
        mode    => $nagios::params::mode,
        owner   => $nagios::params::owner,
    }
}
