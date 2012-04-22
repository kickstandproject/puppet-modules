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
class ntp::common::config {
    include ntp::params

    file { $ntp::params::configfile:
        ensure  => present,
        content => template('ntp/etc/ntp.conf.erb'),
        notify  => Class['ntp::common::service'],
        require => Class['ntp::common::install'],
    }

    file { $ntp::params::defaultfile:
        ensure  => present,
        content => template('ntp/etc/default/ntp.erb'),
        notify  => Class['ntp::common::service'],
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
