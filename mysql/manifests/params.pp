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
class mysql::params {
    $packagename = $operatingsystem ? {
        default => 'mysql-server',
    }

    $packagename_client = $operatingsystem ? {
        default => 'mysql',
    }

    $servicename = $operatingsystem ? {
        default => 'mysql',
    }

    $processname = $operatingsystem ? {
        default => 'mysqld',
    }

    $hasstatus = $operatingsystem ? {
        default => false,
    }

    $configfile = $operatingsystem ? {
        default => '/etc/mysql/my.cnf',
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
        default => '/etc/mysql/conf.d',
    }

    $bindaddr = $mysql_bindaddr ? {
        ''  => '0.0.0.0',
        default => "$mysql_bindaddr",
    }

    $db_user = $mysql_db_user ? {
        ''  => 'root',
        default => "$mysql_db_user",
    }

    $db_password = $mysql_db_password ? {
        ''  => '',
        default => "$mysql_db_password",
    }

    $port = $mysql_port ? {
        ''  => '3306',
        default => "$mysql_port",
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
