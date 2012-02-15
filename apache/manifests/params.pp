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
    $configdir = $operatingsystem ? {
        default => '/etc/apache2',
    }

    $configfile = $operatingsystem ? {
        default => '/etc/apache2/apache2.conf',
    }

    $configfile_group = $operatingsystem ? {
        default => 'www-data',
    }

    $configfile_mode = $operatingsystem ? {
        default => '0664',
    }

    $configfile_owner = $operatingsystem ? {
        default => 'www-data',
    }

    $customconfigdir = $operatingsystem ? {
        default => "${configdir}/conf.d",
    }

    $defaultfile = $operatingsystem ? {
        default => '/etc/default/apache2',
    }

    $rootdir = $operatingsystem ? {
        default => '/var/www',
    }

    $hasstatus = $operatingsystem ? {
        default => true,
    }

    $logdir = $operatingsystem ? {
        default => '/var/log/apache2',
    }

    $packagename = $operatingsystem ? {
        default => 'apache2',
    }

    $processname = $operatingsystem ? {
        default => 'apache2',
    }

    $servicename = $operatingsystem ? {
        default => 'apache2',
    }

    $virtualhostdir = $operatingsystem ? {
        default => '/etc/apache2/sites-available',
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
