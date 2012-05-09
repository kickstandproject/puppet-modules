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
class reprepro::params {
    $basedir = $::operatingsystem ? {
        default => '/var/lib/reprepro',
    }

    $mode = $::operatingsystem ? {
        default => '0644',
    }

    $packagename = $::operatingsystem ? {
        default => 'reprepro',
    }

    $distributions = $::reprepro_distributions ? {
        ''      => [
            'precise'
        ],
        default => $::reprepro_distributions,
    }

    $user = $::reprepro_user ? {
        ''      => 'reprepro',
        default => $::reprepro_user,
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
