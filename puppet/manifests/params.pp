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
class puppet::params {
    $packagename = $operatingsystem ? {
        default => 'puppetmaster',
    }

    $packagename_client = $operatingsystem ? {
        default => 'puppet',
    }

    $servicename = $operatingsystem ? {
        default => 'puppet',
    }

    $processname = $operatingsystem ? {
        default => 'root',
    }

    $hasstatus = $operatingsystem ? {
        default => true,
    }

    $configfile = $operatingsystem ? {
        default => '/etc/puppet/puppet.conf',
    }

    $configfile_mode = $operatingsystem ? {
        default => '644',
    }

    $configfile_owner = $operatingsystem ? {
        default => 'root',
    }

    $configfile_group = $operatingsystem ? {
        default => 'root',
    }

    $configdir = $operatingsystem ? {
        default => '/etc/puppet',
    }

    $defaultsfile = $operatingsystem ? {
        default => '/etc/default/puppet',
    }

    $server = $puppet_server ? {
        ''  => 'puppet',
        default => $puppet_server,
    }

    $runinterval = $puppet_runinterval ? {
        ''  => '1800',
        default => $puppet_runinterval,
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
