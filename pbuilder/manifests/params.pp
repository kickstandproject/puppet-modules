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
class pbuilder::params {
    $cachedir = $operatingsystem ? {
        default => '/var/cache/pbuilder',
    }

    $components = $pbuilder_components ? {
        ''      => 'main universe',
        default => $pbuilder_components,
    }

    $configdir = $operatingsystem ? {
        default => '/etc/pbuilder',
    }

    $configfile = $operatingsystem ? {
        default => '/etc/pbuilderrc',
    }

    $group = $operatingsystem ? {
        default => 'root',
    }

    $mode = $operatingsystem ? {
        default => '0644',
    }

    $owner = $operatingsystem ? {
        default => 'root',
    }

    $distributions = $pbuilder_distributions ? {
        ''      => 'precise',
        default => $pbuilder_distributions,
    }

    /* XXX TODO common module? */
    $localbindir = $operatingsystem ? {
        default => '/usr/local/bin',
    }

    $mirror = $pbuilder_mirror ? {
        ''      => 'ca.archive.ubuntu.com',
        default => $pbuilder_mirror,
    }

    $mirror_protocol = $pbuilder_mirror_protocol ? {
        ''      => 'http://',
        default => $pbuilder_mirror_protocol,
    }

    $packagename = $operatingsystem ? {
        default => 'pbuilder',
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
