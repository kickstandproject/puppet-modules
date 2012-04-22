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
class timezone::params {
    $packagename = $::operatingsystem ? {
        default => 'tzdata',
    }

    $configfile = $::operatingsystem ? {
        default => '/etc/timezone',
    }

    $configfile_mode = $::operatingsystem ? {
        default => '0644',
    }

    $configfile_owner = $::operatingsystem ? {
        default => 'root',
    }

    $configfile_group = $::operatingsystem ? {
        default => 'root',
    }

    $zone = $timezone_zoneinfo ? {
        ''      => 'America/Toronto',
        default => $timezone_zone,
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
