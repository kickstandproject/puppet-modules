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
class polycom-provision::common::config {
    require polycom-ucs::params
    require polycom-bootrom::params
    include polycom-provision::params

    file { $polycom-provision::params::basedir:
        ensure  => directory,
        purge   => true,
        recurse => true,
    }

    file { "${polycom-provision::params::basedir}/000000000000.cfg":
        ensure  => present,
        content => template('polycom-provision/var/lib/polycom-provision/000000000000.cfg.erb'),
        require => File[$polycom-provision::params::basedir],
    }

    file { "${polycom-provision::params::basedir}/configs":
        ensure  => directory,
        require => File[$polycom-provision::params::basedir],
    }

    file { "${polycom-provision::params::basedir}/contacts":
        ensure  => directory,
        require => File[$polycom-provision::params::basedir],
    }

    file { "${polycom-provision::params::basedir}/features.cfg":
        ensure  => present,
        content => template('polycom-provision/var/lib/polycom-provision/features.cfg.erb'),
        require => File[$polycom-provision::params::basedir],
    }

    file { "${polycom-provision::params::basedir}/firmwares":
        ensure  => link,
        target  => "${polycom-ucs::params::basedir}/firmwares",
        require => File[$polycom-provision::params::basedir],
    }

    file { "${polycom-provision::params::basedir}/images":
        ensure  => link,
        target  => "${polycom-ucs::params::basedir}/images",
        require => File[$polycom-provision::params::basedir],
    }

    file { "${polycom-provision::params::basedir}/logs":
        ensure  => directory,
        group   => 'www-data',
        mode    => '0644',
        owner   => 'www-data',
        require => File[$polycom-provision::params::basedir],
    }

    $bootroms = [
        '2345-12200-001.bootrom.ld',
        '2345-12200-002.bootrom.ld',
        '2345-12200-004.bootrom.ld',
        '2345-12200-005.bootrom.ld',
        '2345-12360-001.bootrom.ld',
        '2345-12365-001.bootrom.ld',
        '2345-12375-001.bootrom.ld',
        '2345-12450-001.bootrom.ld',
        '2345-12500-001.bootrom.ld',
        '2345-12560-001.bootrom.ld',
        '2345-12600-001.bootrom.ld',
        '2345-12670-001.bootrom.ld',
        '3111-15600-001.bootrom.ld',
        '3111-30900-001.bootrom.ld',
        '3111-40000-001.bootrom.ld'
    ]

    polycom-provision::function::bootrom { $bootroms:
    }

    apache::function::virtualhost { $polycom-provision::params::hostname:
        content     => template('polycom-provision/etc/apache2/conf.d/polycom-provision.conf.erb'),
    }

    apache::function::htdigest { $polycom-provision::params::hostname:
        authname    => 'polycom-provision',
        location    => '/polycom',
        password    => $polycom-provision::params::password,
        username    => $polycom-provision::params::username,
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
