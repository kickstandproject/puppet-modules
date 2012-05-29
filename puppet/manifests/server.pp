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
class puppet::server(
    $options = {}

) {
    require ruby-activerecord::client
    require ruby-mysql::client

    $defaults = {
        'dbadapter'     => 'mysql',
        'dbname'        => 'puppet',
        'dbpassword'    => '',
        'dbserver'      => 'localhost',
        'dbuser'        => 'puppet',
        'storeconfigs'  => 'true',
    }

    $options_real = merge($defaults, $options)

    if (($options_real['storeconfigs'] == 'true') and ($options_real['dbpassword'] == '')) {
        fail('$options[\'dbpassword\'] paramater must not be empty.')
    }

    include puppet::params::server
    include puppet::server::init

    common::function::database { $puppet::params::server::packagename:
        password    => $options_real['dbpassword'],
        server      => $options_real['dbserver'],
        table       => $options_real['dbname'],
        type        => $options_real['dbadapter'],
        user        => $options_real['dbuser'],
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
