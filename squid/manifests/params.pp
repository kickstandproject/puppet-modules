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
class squid::params {
    $basedir = $::operatingsystem ? {
        default => '/etc/squid3',
    }

    $configfile = $::operatingsystem ? {
        default => '/etc/squid3/squid.conf',
    }

    $group = $::operatingsystem ? {
        default => 'root',
    }

    $hasstatus = $::operatingsystem ? {
        default => true,
    }

    $mode = $::operatingsystem ? {
        default => '0644',
    }

    $owner = $::operatingsystem ? {
        default => 'root',
    }

    $packagename = $::operatingsystem ? {
        default => 'squid3',
    }

    $processname = $::operatingsystem ? {
        default => 'proxy',
    }

    $servicename = $::operatingsystem ? {
        default => 'squid3',
    }

    $port = $squid_port ? {
        ''      => '3128',
        default => $squid_port,
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
