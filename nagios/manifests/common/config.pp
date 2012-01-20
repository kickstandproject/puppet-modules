class nagios::common::config {
    File {
        group   => $nagios::params::configfile_group,
        mode    => $nagios::params::configfile_mode,
        owner   => $nagios::params::configfile_owner,
    }

    if (defined(Class['nagios::client'])) {
        File[$nagios::params::configfile] {
            content => template('nagios/client/nagios.cfg.erb')
        }
    } else {
        File[$nagios::params::configfile] {
            content => template('nagios/server/nagios.cfg.erb')
        }
    }

    file { $nagios::params::configfile:
        ensure  => present,
        notify  => Class['nagios::common::service'],
        require => Class['nagios::common::install'],
    }

    file { $nagios::params::customconfigdir:
        ensure  => directory,
        force   => true,
        require => Class['nagios::common::install'],
        recurse => true,
    }

    file { "${nagios::params::customconfigdir}/commands":
        ensure  => directory,
        require => File[$nagios::params::customconfigdir],
    }

    file { "${nagios::params::customconfigdir}/commands/general.cfg":
        content => template('nagios/client/commands/general.cfg.erb'),
        ensure  => present,
        require => File["${nagios::params::customconfigdir}/commands"],
    }

    file { "${nagios::params::customconfigdir}/contacts.cfg":
        content => template('nagios/client/contacts.cfg.erb'),
        ensure  => present,
        require => File[$nagios::params::customconfigdir],
    }

    file { "${nagios::params::customconfigdir}/hosts":
        ensure  => directory,
        require => File[$nagios::params::customconfigdir],
    }

    file { "${nagios::params::customconfigdir}/hosts/generic.cfg":
        content => template('nagios/client/hosts/generic.cfg.erb'),
        ensure  => present,
        require => File["${nagios::params::customconfigdir}/hosts"],
    }

    file { "${nagios::params::customconfigdir}/hostgroups":
        ensure  => directory,
        require => File[$nagios::params::customconfigdir],
    }

    file { "${nagios::params::customconfigdir}/hostgroups/all.cfg":
        content => template('nagios/client/hostgroups/all.cfg.erb'),
        ensure  => present,
        require => File["${nagios::params::customconfigdir}/hostgroups"],
    }

    file { "${nagios::params::customconfigdir}/services":
        ensure  => directory,
        require => File[$nagios::params::customconfigdir],
    }

    file { "${nagios::params::customconfigdir}/services/active":
        ensure  => directory,
        require => File["${nagios::params::customconfigdir}/services"],
    }

    file { "${nagios::params::customconfigdir}/services/passive":
        ensure  => directory,
        require => File["${nagios::params::customconfigdir}/services"],
    }

    file { "${nagios::params::customconfigdir}/services/generic.cfg":
        content => template('nagios/client/services/generic.cfg.erb'),
        ensure  => present,
        require => File["${nagios::params::customconfigdir}/services"],
    }

    file { "${nagios::params::customconfigdir}/timeperiods.cfg":
        content => template('nagios/client/timeperiods.cfg.erb'),
        ensure  => present,
        require => File[$nagios::params::customconfigdir],
    }

    file { $nagios::params::plugindir:
        ensure  => present,
        require => Class['nagios::common::install'],
    }
}
