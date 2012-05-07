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
class puppet::server inherits puppet::common::init {
    require ruby-activerecord::client
    require ruby-mysql::client

    common::function::database { $puppet::params::packagename:
        password    => $puppet::params::db_password,
        server      => $puppet::params::db_server,
        table       => $puppet::params::db_name,
        type        => $puppet::params::db,
        user        => $puppet::params::db_user,
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
