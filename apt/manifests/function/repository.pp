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
define apt::function::repository (
    $components,
    $key,
    $url,
    $dist = $lsbdistcodename,
    $protocol = 'http://',
) {
    require apt::client

    file { "${name}.list":
        ensure  => present,
        content => template('apt/etc/apt/sources.list.d/repo.list'),
        notify  => Exec["apt-key ${key}"],
        path    => "${apt::params::basedir}/sources.list.d/${name}.list",
        require => Class['apt::common::config'],
    }

    exec { "apt-key ${key}":
        command     => "apt-key adv --keyserver pgp.mit.edu --recv-keys ${key}",
        before      => Exec['apt-get update'],
        notify      => Exec['apt-get update'],
        refreshonly => true,
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
