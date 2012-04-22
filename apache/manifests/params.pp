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
class apache::params {
    $basedir = $::operatingsystem ? {
        default => '/etc/apache2',
    }

    $configdir = $::operatingsystem ? {
        default => '/etc/apache2/conf.d',
    }

    $configfile = $::operatingsystem ? {
        default => '/etc/apache2/apache2.conf',
    }

    $group = $::operatingsystem ? {
        default => 'root',
    }

    $defaultfile = $::operatingsystem ? {
        default => '/etc/default/apache2',
    }

    $rootdir = $::operatingsystem ? {
        default => '/var/www',
    }

    $hasstatus = $::operatingsystem ? {
        default => true,
    }

    $logdir = $::operatingsystem ? {
        default => '/var/log/apache2',
    }

    $mode = $::operatingsystem ? {
        default => '0644',
    }

    $owner = $::operatingsystem ? {
        default => 'root',
    }

    $packagename = $::operatingsystem ? {
        default => 'apache2',
    }

    $processname = $::operatingsystem ? {
        default => 'apache2',
    }

    $servicename = $::operatingsystem ? {
        default => 'apache2',
    }

    $virtualhostdir = $::operatingsystem ? {
        default => '/etc/apache2/sites-enabled',
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
