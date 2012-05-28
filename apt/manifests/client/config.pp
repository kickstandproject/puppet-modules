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
class apt::client::config(
    $stage = $apt::client::stage
) {
    include apt::common::config

    file { $apt::params::client::basedir:
        ensure  => directory,
        require => Class['apt::client::install'],
    }

    file { $apt::params::client::configdir:
        ensure  => directory,
        require => File[$apt::params::client::basedir],
    }

    file { "${apt::params::client::basedir}/apt.conf":
        ensure  => absent,
        require => File[$apt::params::client::basedir],
    }

    file { "${apt::params::client::basedir}/sources.list.d":
        ensure  => directory,
        notify  => Exec['apt-get update'],
        purge   => true,
        recurse => true,
        require => File[$apt::params::client::basedir],
    }

    file { '/var/local/preseed':
        ensure  => directory,
        purge   => true,
        recurse => true,
    }

    file { "${apt::params::client::basedir}/sources.list":
        ensure  => present,
        content => template('apt/etc/apt/sources.list.erb'),
        notify  => Exec['apt-get update'],
        require => File[$apt::params::client::basedir],
    }

    apt::function::config { '10periodic':
        ensure  => present,
        content => template('apt/etc/apt/apt.conf.d/10periodic.erb'),
    }

    apt::function::config { '50unattended-upgrades':
        ensure  => present,
        content => template('apt/etc/apt/apt.conf.d/50unattended-upgrades.erb'),
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
