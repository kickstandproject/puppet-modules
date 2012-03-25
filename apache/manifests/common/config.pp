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
class apache::common::config {
    file { $apache::params::defaultfile:
        ensure  => present,
        content => template('apache/etc/default/apache2.erb'),
        require => Class['apache::common::install'],
    }

    file { $apache::params::basedir:
        ensure  => directory,
        require => Class['apache::common::install'],
    }

    file { "${apache::params::basedir}/sites-available":
        ensure  => directory,
        purge   => true,
        recurse => true,
        require => File[$apache::params::basedir],
    }

    file { "${apache::params::basedir}/sites-enabled":
        ensure  => directory,
        purge   => true,
        recurse => true,
        require => File[$apache::params::basedir],
    }

    file { $apache::params::configdir:
        ensure  => directory,
        require => File[$apache::params::basedir],
    }

    file { $apache::params::configfile:
        ensure  => present,
        content => template('apache/etc/apache2/apache2.conf.erb'),
        require => File[$apache::params::basedir],
    }

    file { $apache::params::rootdir:
        ensure  => directory,
        force   => true,
        purge   => true,
        recurse => true,
        require => Class['apache::common::install'],
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
