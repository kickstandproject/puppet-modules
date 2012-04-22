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
class nagios::nsca::params {
    $configfile = $::operatingsystem ? {
        default => '/etc/nsca.cfg',
    }

    $configfile_client = $::operatingsystem ? {
        default => '/etc/send_nsca.cfg',
    }

    $configfile_group = $::operatingsystem ? {
        default => 'root',
    }

    $configfile_mode = $::operatingsystem ? {
        default => '0644',
    }

    $configfile_owner = $::operatingsystem ? {
        default => 'root',
    }

    $hasstatus = $::operatingsystem ? {
        default => false,
    }

    $packagename = $::operatingsystem ? {
        default => 'nsca',
    }

    $server = $nagios_nsca_server ? {
        ''      => 'nagios',
        default => $nagios_nsca_server,
    }

    $servicename = $::operatingsystem ? {
        default => 'nsca',
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
