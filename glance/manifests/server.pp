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
class glance::server inherits glance::common::init {
    common::function::database { $glance::params::db_name:
        password    => $glance::params::db_password,
        server      => $glance::params::db_server,
        type        => $glance::params::db,
        user        => $glance::params::db_user,
    }

    package { $glance::params::mysql:
        ensure  => present,
    }

    if ($monitor == 'yes') {
        include glance::common::monitor
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
