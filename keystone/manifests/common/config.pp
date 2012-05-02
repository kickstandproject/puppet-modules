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
class keystone::common::config {
    file { $keystone::params::basedir:
        ensure  => directory,
        require => Class['keystone::common::install'],
    }

    file { "${keystone::params::basedir}/keystone.conf":
        ensure  => present,
        content => template('keystone/etc/keystone/keystone.conf.erb'),
        notify  => Class['keystone::common::service'],
        require => File[$keystone::params::basedir],
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
