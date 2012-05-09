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
class asterisk::common::config {
    include asterisk::params
    include asterisk::common::command

    file { $asterisk::params::basedir:
        ensure  => directory,
        require => Class['asterisk::common::install'],
    }

    file { "${asterisk::params::basedir}/modules.conf.d":
        ensure  => directory,
        require => File[$asterisk::params::basedir],
    }

    file { "${asterisk::params::basedir}/sip.conf.d":
        ensure  => directory,
        notify  => Exec['asterisk-module-reload-chan_sip.so'],
        purge   => true,
        recurse => true,
        require => File[$asterisk::params::basedir],
    }

    file { "${asterisk::params::basedir}/sip.conf.d/10general.conf":
        ensure  => present,
        content => template('asterisk/etc/asterisk/sip.conf.d/10general.conf.erb'),
        notify  => Exec['asterisk-module-reload-chan_sip.so'],
        require => File["${asterisk::params::basedir}/sip.conf.d"],
    }

    file { "${asterisk::params::basedir}/sip.conf.d/10templates.conf":
        ensure  => present,
        content => template('asterisk/etc/asterisk/sip.conf.d/10templates.conf.erb'),
        notify  => Exec['asterisk-module-reload-chan_sip.so'],
        require => File["${asterisk::params::basedir}/sip.conf.d"],
    }

    file { "${asterisk::params::basedir}/sip.conf.d/20includes.conf":
        ensure  => present,
        content => template('asterisk/etc/asterisk/sip.conf.d/20includes.conf.erb'),
        notify  => Exec['asterisk-module-reload-chan_sip.so'],
        require => File["${asterisk::params::basedir}/sip.conf.d"],
    }

    file { "${asterisk::params::basedir}/sip.conf.d/devices":
        ensure  => directory,
        notify  => Exec['asterisk-module-reload-chan_sip.so'],
        purge   => true,
        recurse => true,
        require => File["${asterisk::params::basedir}/sip.conf.d/20includes.conf"],
    }

    file { "${asterisk::params::basedir}/sip.conf.d/registrations":
        ensure  => directory,
        notify  => Exec['asterisk-module-reload-chan_sip.so'],
        purge   => true,
        recurse => true,
        require => File["${asterisk::params::basedir}/sip.conf.d/20includes.conf"],
    }

    if (($asterisk::params::externaddr) or ($asterisk::params::externhost)) {
        file { "${asterisk::params::basedir}/sip.conf.d/10nat.conf":
            ensure  => present,
            content => template('asterisk/etc/asterisk/sip.conf.d/10nat.conf.erb'),
            notify  => Exec['asterisk-module-reload-chan_sip.so'],
            require => File["${asterisk::params::basedir}/sip.conf.d"],
        }
    }

    file { "${asterisk::params::basedir}/queues.conf.d":
        ensure  => directory,
        notify  => Exec['asterisk-module-reload-app_queue.so'],
        purge   => true,
        recurse => true,
        require => File[$asterisk::params::basedir],
    }

    file { "${asterisk::params::basedir}/queues.conf.d/20includes.conf":
        ensure  => present,
        content => template('asterisk/etc/asterisk/queues.conf.d/20includes.conf.erb'),
        notify  => Exec['asterisk-module-reload-app_queue.so'],
        require => File["${asterisk::params::basedir}/queues.conf.d"],
    }

    file { "${asterisk::params::basedir}/queues.conf.d/includes":
        ensure  => directory,
        force   => true,
        notify  => Exec['asterisk-module-reload-app_queue.so'],
        purge   => true,
        recurse => true,
        require => File["${asterisk::params::basedir}/queues.conf.d"],
    }

    file { $asterisk::params::spooldir:
        ensure  => directory,
        require => Class['asterisk::common::install'],
    }

    polycom-provision::function::sip-basic { $name:
        server  => $asterisk::params::server,
        port    => $asterisk::params::sip_port,
    }

    asterisk::function::customdir { 'asterisk.conf':
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
