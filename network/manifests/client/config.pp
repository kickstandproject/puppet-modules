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
class network::client::config {
    include network::common::config

    file { "${network::params::client::basedir}/if-down.d":
        ensure  => directory,
        require => File[$network::params::client::basedir],
    }

    file { "${network::params::client::basedir}/if-post-down.d":
        ensure  => directory,
        require => File[$network::params::client::basedir],
    }

    file { "${network::params::client::basedir}/if-pre-up.d":
        ensure  => directory,
        require => File[$network::params::client::basedir],
    }

    file { "${network::params::client::basedir}/if-up.d":
        ensure  => directory,
        require => File[$network::params::client::basedir],
    }

    file { $network::params::client::configfile:
        ensure  => present,
        content => template('network/etc/network/interfaces.erb'),
        notify  => Class['network::client::service'],
        require => File[$network::params::client::basedir],
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
