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
class reprepro::common::config {
    require reprepro::params

    File {
        group   => $reprepro::params::user,
        mode    => '0644',
        owner   => $reprepro::params::user,
    }

    user { $reprepro::params::user:
        ensure  => present,
        home    => $reprepro::params::homedir,
        system  => true,
    }

    file { $reprepro::params::homedir:
        ensure  => directory,
    }

    file { "${reprepro::params::homedir}/repos":
        ensure          => directory,
        force           => true,
        purge           => true,
        recurse         => true,
        recurselimit    => 1,
        require         => File[$reprepro::params::homedir],
    }

    file { '/etc/sudoers.d/reprepro':
        ensure  => present,
        content => template('reprepro/server/etc/sudoers.d/reprepro.erb'),
        group   => 'root',
        mode    => '0440',
        owner   => 'root',
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
