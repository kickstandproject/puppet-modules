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
define asterisk::function::customdir(
) {
    require asterisk::server

    $base = "${asterisk::params::basedir}/${name}.d"

    file { $base:
        ensure  => directory,
        force   => true,
        notify  => Exec["asterisk-module-reload-${name}"],
        purge   => true,
        recurse => true,
        require => File[$asterisk::params::basedir],
    }

    file { "${base}/custom.d":
        ensure  => directory,
        require => File[$base],
    }

    file { "${base}/99custom.conf":
        ensure  => present,
        content => template('asterisk/etc/asterisk/sip.conf.d/99custom.conf.erb'),
        require => File[$base],
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
