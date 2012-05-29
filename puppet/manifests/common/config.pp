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
class puppet::common::config {
    file { $puppet::params::basedir:
        ensure  => directory,
        force   => true,
        purge   => true,
        recurse => true,
        require => Class['puppet::common::install'],
    }

    common::function::concat { $puppet::params::configfile:
    }

    common::function::concat::fragment { 'puppet.conf-header':
        target  => $puppet::params::configfile,
        content => template('puppet/etc/puppet/puppet.conf-header.erb'),
        order   => 01,
    }

    file { [
        "${puppet::params::basedir}/manifests",
        "${puppet::params::basedir}/modules",
        "${puppet::params::basedir}/templates",
    ]:
        ensure  => directory,
        require => File[$puppet::params::basedir],
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
