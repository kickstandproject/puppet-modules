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
class rebuildd::params {
    $basedir = $::operatingsystem ? {
        default => '/etc/rebuildd',
    }

    $configfile = $::operatingsystem ? {
        default => '/etc/rebuildd/rebuilddrc',
    }

    $defaultsfile = $::operatingsystem ? {
        default => '/etc/default/rebuildd',
    }

    $group = $::operatingsystem ? {
        default => 'root',
    }

    $hasrestart = $::operatingsystem ? {
        default => false,
    }

    $hasstatus = $::operatingsystem ? {
        default => false,
    }

    $mode = $::operatingsystem ? {
        default => '0644',
    }

    $owner = $::operatingsystem ? {
        default => 'root',
    }

    $packagename = $::operatingsystem ? {
        default => 'rebuildd',
    }

    $processname = $::operatingsystem ? {
        default => 'rebuildd',
    }

    $servicename = $::operatingsystem ? {
        default => 'rebuildd',
    }

    $distributions = $rebuildd_distributions ? {
        ''      => [
            'precise',
        ],
        default => $rebuildd_distributions,
    }

    $email = $rebuildd_email ? {
        ''      => 'rebuildd@localhost',
        default => $rebuildd_email,
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
