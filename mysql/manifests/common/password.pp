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
class mysql::common::password {
    # TODO: Remove hardcoded paths
    require mysql::params

    file { '/root/.my.cnf':
        content => template('mysql/server/my.cnf.root.erb'),
        ensure  => present,
        group   => $mysql::params::configfile_group,
        mode    => 400,
        name    => '/root/.my.cnf',
        owner   => $mysql::params::configfile_owner,
        replace => 'false',
        require => Exec['mysql_root_password'],
    }
    
    exec { 'mysql_root_password':
        command     => "/usr/bin/mysqladmin -uroot password '${mysql::params::db_password}'",
        subscribe   => Class['mysql::common::install'],
        refreshonly => true,
        require     => Class['mysql::common::service'],
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
