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
class puppet::client::config {
    include puppet::common::config

    common::function::concat::fragment { 'puppet.conf-client':
        target  => $puppet::params::client::configfile,
        content => template('puppet/etc/puppet/puppet.conf-client.erb'),
        order   => 03,
    }

    file { $puppet::params::client::defaultsfile:
        ensure  => present,
        content => template('puppet/etc/default/puppet.erb'),
        notify  => Class['puppet::client::service'],
        require => Class['puppet::client::install'],
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
