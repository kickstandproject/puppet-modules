#
# puppet-modules: The Kickstand Project
#
# Copyright (C) 2011, Polybeacon, Inc.
#
# Paul Belanger <paul.belanger@polybeacon.com>
#
# See http://kickstand-project.org for more information about
# the Kickstand project. Please do not directly contact any
# of the maintainers of this project for assistance; the
# project provides a web site, forums and IRC channels for
# your use.
#
# This program is free software, distributed under the terms
# of the GNU General Public License Version 2. See the LICENSE
# file at the top of the source tree.
#
class apt::common::config {
    require apt::params

    file { $apt::params::basedir:
        ensure  => directory,
        require => Class['apt::common::install'],
    }

    file { $apt::params::configdir:
        ensure  => directory,
        require => File[$apt::params::basedir],
    }

    file { "${apt::params::basedir}/apt.conf":
        ensure  => absent,
        require => File[$apt::params::basedir],
    }

    file { "${apt::params::basedir}/sources.list.d":
        ensure  => directory,
        purge   => true,
        recurse => true,
        require => File[$apt::params::basedir],
    }

    file { '/var/local/preseed':
        ensure  => directory,
        purge   => true,
        recurse => true,
    }

    file { "${apt::params::basedir}/sources.list":
        ensure  => present,
        content => template('apt/etc/apt/sources.list.erb'),
        require => File[$apt::params::basedir],
    }

    apt::function::config { '10periodic':
        ensure  => present,
        content => template('apt/etc/apt/apt.conf.d/10periodic.erb'),
    }

    apt::function::config { '50unattended-upgrades':
        ensure  => present,
        content => template('apt/etc/apt/apt.conf.d/50unattended-upgrades.erb'),
    }

    exec { 'apt-get clean':
        command        => 'apt-get clean',
        subscribe      => [
            File["${apt::params::basedir}/sources.list"],
            File["${apt::params::basedir}/sources.list.d"],
        ],
        refreshonly    => true,
    }

    exec { 'apt-get update':
        command        => 'apt-get update',
        subscribe      => Exec['apt-get clean'],
        refreshonly    => true,
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
