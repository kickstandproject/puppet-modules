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
class mantisbt::mysql::init {
    require mantisbt::params

    if ($mantisbt::params::db_server == 'localhost') {
        include mysql::server
    }

    mysql::functions::grant { 'mantisbt::mysql::init':
        db_name     => $mantisbt::params::db_name,
        db_password => $mantisbt::params::db_password,
        db_server   => $mantisbt::params::db_server,
        db_user     => $mantisbt::params::db_user,
    }

    package { $mantisbt::params::mysql:
        ensure  => present,
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
