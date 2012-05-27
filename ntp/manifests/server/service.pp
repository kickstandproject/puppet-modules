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
class ntp::server::service {
    include ntp::common::service

    service { $ntp::params::server::servicename:
        ensure      => running,
        enable      => true,
        hasrestart  => true,
        hasstatus   => $ntp::params::server::hasstatus,
        require     => Class['ntp::server::config'],
        subscribe   => File[$ntp::params::server::configfile],
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
