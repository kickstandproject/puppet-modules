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
class nova::server inherits nova::common::init {
    require rabbitmq::server

    if ($nova::params::api) {
        include nova::api::server
    }

    if ($nova::params::cert) {
        include nova::cert::server
    }

    if ($nova::params::network) {
        include nova::network::server
    }

    if ($nova::params::objectstore) {
        include nova::objectstore::server
    }

    if ($nova::params::scheduler) {
        include nova::scheduler::server
    }

    if ($nova::params::volume) {
        include nova::volume::server
    }

    if ($monitor == 'yes') {
        include nova::common::monitor
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
