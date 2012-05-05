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
define mysql::functions::grant(
    $db_name,
    $db_user,
    $db_password,
    $db_server = 'localhost',
) {
    require mysql::server
    require puppet::client

    $path = "${puppet::params::varlocal}/${name}"
    $mysql_grant_file = "mysqlgrant-${db_user}-${db_server}-${db_name}.sql"

    file { $mysql_grant_file:
        ensure  => present,
        content => template('mysql/root/grant.erb'),
        require => File[$path],
        path    => "${path}/${mysql_grant_file}",
    }

    exec { "mysqlgrant-${db_user}-${db_server}-${db_name}":
        command => "mysql --defaults-file=/root/.my.cnf -uroot < ${path}/${mysql_grant_file}",
        subscribe   => File[$mysql_grant_file],
        refreshonly => true,
        require     => File['/root/.my.cnf'],
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
