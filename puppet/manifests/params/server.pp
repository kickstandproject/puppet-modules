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
class puppet::params::server inherits puppet::params {
    $defaultsfile = $::operatingsystem ? {
        default => '/etc/default/puppetmaster',
    }

    $hasstatus = $::operatingsystem ? {
        default => true,
    }

    $packagename = $::operatingsystem ? {
        default => 'puppetmaster',
    }

    $processname = $::operatingsystem ? {
        default => 'puppet -a master',
    }

    $servicename = $::operatingsystem ? {
        default => 'puppetmaster',
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
