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

    if defined(Class['puppet::client']) {
        $content = 'client'
    } else {
        $content = 'server'
    }

    file { "$puppet::params::configfile":
        content => template("puppet/$content/puppet.conf.erb"),
        ensure  => present,
        group   => $puppet::params::configfile_group,
        mode    => $puppet::params::configfile_mode,
        notify  => Class['puppet::common::service'],
        owner   => $puppet::params::configfile_owner,
        require => Class['puppet::common::install'],
    }

    file { "$puppet::params::defaultsfile":
        content => template("puppet/$content/puppet.erb"),
        ensure  => present,
        group   => $puppet::params::configfile_group,
        mode    => $puppet::params::configfile_mode,
        notify  => Class['puppet::common::service'],
        owner   => $puppet::params::configfile_owner,
        require => Class['puppet::common::install'],
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
