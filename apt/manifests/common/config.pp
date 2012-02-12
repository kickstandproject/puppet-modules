class apt::common::config {
    File {
        group   => $apt::params::configfile_group,
        mode    => $apt::params::configfile_mode,
        owner   => $apt::params::configfile_owner,
    }

    file { $apt::params::configdir:
        ensure  => directory,
        require => Class['apt::common::install'],
    }

    file { "${apt::params::configdir}/sources.list.d":
        ensure  => directory,
        purge   => true,
        require => File[$apt::params::configdir],
        recurse => true,
    }

    file { "${apt::params::configdir}/sources.list":
        ensure  => present,
        content => template('apt/client/etc/apt/sources.list.erb'),
        require => File[$apt::params::configdir],
    }

    file { $apt::params::configfile_dir:
        ensure  => directory,
        require => File[$apt::params::configdir],
    }

    apt::function::config { '10periodic':
        ensure  => present,
        content => template('apt/client/etc/apt/apt.conf.d/10periodic.erb'),
    }

    apt::function::config { '50unattended-upgrades':
        ensure  => present,
        content => template('apt/client/etc/apt/apt.conf.d/50unattended-upgrades.erb'),
    }

    exec { 'apt-get clean':
        command        => '/usr/bin/apt-get clean',
        subscribe      => [
            File["${apt::params::configdir}/sources.list"],
            File["${apt::params::configdir}/sources.list.d"],
        ],
        refreshonly    => true,
    }

    exec { 'apt-get autoclean':
        command        => '/usr/bin/apt-get autoclean',
        subscribe      => Exec['apt-get clean'],
        refreshonly    => true,
    }

    exec { 'apt-get update':
        command        => '/usr/bin/apt-get update',
        subscribe      => Exec['apt-get autoclean'],
        refreshonly    => true,
    }
}
