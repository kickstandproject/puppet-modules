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
    require puppet::params

    file { $puppet::params::basedir:
        ensure  => directory,
        force   => true,
        purge   => true,
        recurse => true,
        require => Class['puppet::common::install'],
    }

    file { [
        "${puppet::params::basedir}/manifests",
        "${puppet::params::basedir}/modules",
        "${puppet::params::basedir}/templates",
    ]:
        ensure  => directory,
        require => File[$puppet::params::basedir],
    }

    file { $puppet::params::configfile:
        ensure  => present,
        content => template("puppet/etc/puppet/puppet.conf-${puppet::params::type}.erb"),
        notify  => Class['puppet::common::service'],
        require => File[$puppet::params::basedir],
    }

    file { $puppet::params::defaultsfile:
        ensure  => present,
        content => template('puppet/etc/default/puppet.erb'),
        notify  => Class['puppet::common::service'],
        require => Class['puppet::common::install'],
    }

    file { $puppet::params::varlocal:
        ensure  => directory,
        force   => true,
        purge   => true,
        recurse => true,
        require => Class['puppet::common::install'],
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
