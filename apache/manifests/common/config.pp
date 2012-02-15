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
# vim:sw=4:ts=4:expandtab:textwidth=79
#
class apache::common::config {
    File {
        group   => $apache::params::configfile_group,
        mode    => $apache::params::configfile_mode,
        owner   => $apache::params::configfile_owner,
        require => Class['apache::common::install'],
    }

    file { $apache::params::defaultfile:
        content => template('apache/server/etc/default/apache2.erb'),
        group   => 'root',
        mode    => '0644',
        owner   => 'root',
        ensure  => present,
    }

    file { $apache::params::rootdir:
        ensure  => directory,
    }

    file { "${apache::params::rootdir}/index.html":
        ensure  => absent,
        require => File[$apache::params::rootdir],
    }

    exec { "apache_a2dissite_default":
        command => "/usr/sbin/a2dissite default",
        onlyif => "/usr/bin/test -f ${apache::params::configdir}/sites-enabled/000-default",
        notify  => Class['apache::common::service'],
        require => Class['apache::common::install'],
    }
}
