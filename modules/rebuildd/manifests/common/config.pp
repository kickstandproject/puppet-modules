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
class rebuildd::common::config {
    include rebuildd::params

    file { $rebuildd::params::basedir:
        ensure  => directory,
        require => Class['rebuildd::common::install']
    }

    file { $rebuildd::params::configfile:
        content => template('rebuildd/etc/rebuildd/rebuilddrc.erb'),
        require => File[$rebuildd::params::basedir],
        notify  => Class[rebuildd::common::service],
    }

    file { $rebuildd::params::defaultsfile:
        content => template('rebuildd/etc/default/rebuildd.erb'),
        notify  => Class[rebuildd::common::service],
    }

    exec { 'rebuildd-create-database':
        command => '/usr/sbin/rebuildd init',
        creates => '/var/lib/rebuildd/rebuildd.db',
        require => Class['rebuildd::common::install'],
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
