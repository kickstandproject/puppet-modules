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
define mysql::grant (
    $mysql_db,
    $mysql_user,
    $mysql_password,
    $mysql_privileges = 'ALL',
    $mysql_host = 'localhost'
    ) {
    require mysql::server

    file { 'mysql_grant_file':
        mode    => 600,
        owner   => root,
        group   => root,
        path    => '/root/blah.sql',
        content => template('mysql/grant.erb'),
        replace => false,
    }

    exec { 'bobobo':
        command     => '/usr/bin/mysql --defaults-file=/root/.my.cnf -uroot < /root/blah.sql',
        require     => Class['mysql::classes::service'],
        subscribe   => File['/root/blah.sql'],
        refreshonly => true,
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
