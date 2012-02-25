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
    $basedir = $operatingsystem ? {
        default => '/etc/puppet',
    }

    $configfile = $operatingsystem ? {
        default => '/etc/puppet/puppet.conf',
    }

    $defaultsfile = $operatingsystem ? {
        default => '/etc/default/puppet',
    }

    $group = $operatingsystem ? {
        default => 'root',
    }

    $hasstatus = $operatingsystem ? {
        default => true,
    }

    $mode = $operatingsystem ? {
        default => '0644',
    }

    $owner = $operatingsystem ? {
        default => 'root',
    }

    $packagename = $operatingsystem ? {
        default => 'puppet',
    }

    $processname = $operatingsystem ? {
        default => 'root',
    }

    $runinterval = $puppet_runinterval ? {
        ''      => '1800',
        default => $puppet_runinterval,
    }

    $server = $puppet_server ? {
        ''      => 'puppet',
        default => $puppet_server,
    }

    $servicename = $operatingsystem ? {
        default => 'puppet',
    }

    $type = defined(Class['puppet::server']) ? {
        true    => 'server',
        default => 'client',
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
