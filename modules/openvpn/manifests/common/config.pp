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
class openvpn::common::config {
    File {
        group   => $openvpn::params::configfile_group,
        mode    => $openvpn::params::configfile_mode,
        owner   => $openvpn::params::configfile_owner,
    }

    file { $openvpn::params::configdir:
        ensure  => directory,
        require => Class['openvpn::common::install'],
    }

    file { $openvpn::params::defaultfile:
        ensure  => present,
        content => template('openvpn/server/etc/default/openvpn.erb'),
        notify  => Class['openvpn::common::service'],
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
