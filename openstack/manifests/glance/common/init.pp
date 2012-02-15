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
class openstack::glance::common::init {
    include openstack::glance::params
    include openstack::glance::common::install
    include openstack::glance::common::config
    include openstack::glance::common::service

    if ($monitor == 'yes') {
        include openstack::glance::common::monitor
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
