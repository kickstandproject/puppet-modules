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
class apt::params {
    $basedir = $operatingsystem ? {
        default => '/etc/apt',
    }

    $components = $apt_components ? {
        ''      => 'main universe',
        default => $apt_components,
    }

    $configdir = $operatingsystem ? {
        default => '/etc/apt/apt.conf.d',
    }

    $group = $operatingsystem ? {
        default => 'root',
    }

    $hasstatus = $operatingsystem ? {
        default => true,
    }

    $packagename = $operatingsystem ? {
        default => 'python-software-properties',
    }

    $processname = $operatingsystem ? {
        default => 'apt',
    }

    $servicename = $operatingsystem ? {
        default => 'apt',
    }

    $mode = $operatingsystem ? {
        default => '0644',
    }

    $owner = $operatingsystem ? {
        default => 'root',
    }

    $mirror = $apt_mirror ? {
        ''      => 'ca.archive.ubuntu.com',
        default => $apt_mirror,
    }

    $mirror_protocol = $apt_mirror_protocol ? {
        ''      => 'http://',
        default => $apt_mirror_protocol,
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
