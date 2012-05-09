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
    $basedir = $::operatingsystem ? {
        default => '/etc/mysql',
    }

    $configdir = $::operatingsystem ? {
        default => '/etc/mysql/conf.d',
    }

    $configfile = $::operatingsystem ? {
        default => '/etc/mysql/my.cnf',
    }

    $group = $::operatingsystem ? {
        default => 'root',
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
        default => 'mysql-server',
    }

    $processname = $::operatingsystem ? {
        default => 'mysqld',
    }

    $servicename = $::operatingsystem ? {
        default => 'mysql',
    }

    $bindaddr = $::mysql_bindaddr ? {
        ''      => '127.0.0.1',
        default => $::mysql_bindaddr,
    }

    $db_user = $::mysql_db_user ? {
        ''      => 'root',
        default => $::mysql_db_user,
    }

    $db_password = $::mysql_db_password ? {
        ''      => '',
        default => $::mysql_db_password,
    }

    $port = $::mysql_port ? {
        ''      => '3306',
        default => $::mysql_port,
    }

    if ($mysql::params::db_password == '') {
        fail('You must assign a default password using \'\$::mysql_db_password\'')
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
