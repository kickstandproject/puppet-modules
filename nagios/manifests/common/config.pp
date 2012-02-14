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
            content => template('nagios/etc/nagios3/nagios.cfg.erb.server')
        }
    }

    file { $nagios::params::basedir:
        ensure  => directory,
        force   => true,
        purge   => true,
        recurse => true,
        require => Class['nagios::common::install'],
    }

    file { "${nagios::params::basedir}/resource.cfg":
        ensure  => present,
        content => template('nagios/etc/nagios3/resource.cfg.erb'),
        notify  => Class['nagios::common::service'],
        require => File[$nagios::params::basedir],
    }

    file { $nagios::params::configdir:
        ensure  => directory,
        force   => true,
        purge   => true,
        recurse => true,
        require => File[$nagios::params::basedir],
    }

    file { $nagios::params::configfile:
        ensure  => present,
        notify  => Class['nagios::common::service'],
        require => File[$nagios::params::basedir],
    }

    file { [
        "${nagios::params::configdir}/commands",
        "${nagios::params::configdir}/hostgroups",
        "${nagios::params::configdir}/hosts",
        "${nagios::params::configdir}/services",
    ]:
        ensure  => directory,
        force   => true,
        purge   => true,
        recurse => true,
        require => File[$nagios::params::configdir],
    }

    file { "${nagios::params::configdir}/commands/general.cfg":
        content => template('nagios/client/commands/general.cfg.erb'),
        ensure  => present,
        require => File["${nagios::params::configdir}/commands"],
    }

    file { "${nagios::params::configdir}/contacts.cfg":
        content => template('nagios/client/contacts.cfg.erb'),
        ensure  => present,
        require => File[$nagios::params::configdir],
    }

    file { "${nagios::params::configdir}/hosts/generic.cfg":
        content => template('nagios/client/hosts/generic.cfg.erb'),
        ensure  => present,
        require => File["${nagios::params::configdir}/hosts"],
    }

    file { "${nagios::params::configdir}/hostgroups/all.cfg":
        content => template('nagios/client/hostgroups/all.cfg.erb'),
        ensure  => present,
        require => File["${nagios::params::configdir}/hostgroups"],
    }

    file { [
        "${nagios::params::configdir}/services/active",
        "${nagios::params::configdir}/services/passive",
    ]:
        ensure  => directory,
        force   => true,
        purge   => true,
        recurse => true,
        require => File["${nagios::params::configdir}/services"],
    }

    file { "${nagios::params::configdir}/services/generic.cfg":
        content => template('nagios/client/services/generic.cfg.erb'),
        ensure  => present,
        require => File["${nagios::params::configdir}/services"],
    }

    file { "${nagios::params::configdir}/timeperiods.cfg":
        content => template('nagios/client/timeperiods.cfg.erb'),
        ensure  => present,
        require => File[$nagios::params::configdir],
    }

    file { $nagios::params::plugindir:
        ensure  => present,
        require => Class['nagios::common::install'],
    }
}
