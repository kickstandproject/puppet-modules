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
class glance::params {
    $basedir = $operatingsystem ? {
        default => '/etc/glance/',
    }

    $configfile = $operatingsystem ? {
        default => '/etc/glance/glance-registry.conf',
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
        default => 'glance',
    }

    $processname = $operatingsystem ? {
        default => 'glance-registry',
    }

    $servicename = $operatingsystem ? {
        default => 'glance-registry',
    }

    $db = $glance_db ? {
        ''      => 'mysql',
        default => $glance_db,
    }

    $db_name = $glance_db_name ? {
        ''      => 'glance',
        default => $glance_db_name,
    }

    $db_password = $glance_db_password ? {
        ''      => 'bob',
        default => $glance_db_password,
    }

    $db_server = $glance_db_server ? {
        ''      => 'localhost',
        default => $glance_db_server",
    }

    $db_user = $glance_db_user ? {
        ''      => 'glancedbadmin',
        default => $glance_db_user,
    }

    $mysql = $operatingsystem ? {
        default => "python-mysqldb",
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
