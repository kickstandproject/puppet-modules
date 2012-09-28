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
class pbuilder::common::config {
    require pbuilder::params

    file { $pbuilder::params::configfile:
        ensure  => present,
        content => template('pbuilder/pbuilderrc.erb'),
    }

    file { $pbuilder::params::cachedir:
        ensure  => directory,
        require => File[$pbuilder::params::configfile],
    }

    file { "${pbuilder::params::cachedir}/ccache":
        ensure  => directory,
        require => File[$pbuilder::params::cachedir],
    }

    file { "${pbuilder::params::cachedir}/hook.d":
        ensure  => directory,
        purge   => true,
        require => File[$pbuilder::params::cachedir],
        recurse => true,
    }

    pbuilder::function::hook { 'D10repository':
        ensure  => present,
        content => template('pbuilder/hook.d/D10repository.erb'),
    }

    pbuilder::function::hook { 'D20aptupdate':
        ensure  => present,
        content => template('pbuilder/hook.d/D20aptupdate.erb'),
    }

    $dists = split($pbuilder::params::distributions, ' ')

    pbuilder::function::distribution { $dists:
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
