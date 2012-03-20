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
define asterisk::function::voicemail(
    context = 'default',
    email = '',
    fullname = '',
    description = '',
) {
    $asterisk_voicemail = 'yes'
    require asterisk::server

    /* XXX TODO Why do we need this here?  For some reason puppet will not honor
       existing one from asterisk::common::init. */
    File {
        group   => $asterisk::params::group,
        mode    => $asterisk::params::mode,
        owner   => $asterisk::params::owner,
    }

    $base = "${asterisk::params::basedir}/voicemail.conf.d"
    $spool = "${asterisk::params::spooldir}/voicemail"

    if (!defined(File["${base}/10${context}.conf"])) {
        file { "${base}/10${context}.conf":
            ensure  => present,
            content => template('asterisk/etc/asterisk/voicemail.conf.d/10mailboxes.conf.erb'),
            notify  => Exec['asterisk-module-reload-app_voicemail.so'],
            require => File[$base],
        }

        file { "${base}/${context}":
            ensure  => directory,
            require => File[$base],
        }
    }

    file { "$base/${context}/${name}.conf":
        ensure  => present,
        content => template('asterisk/etc/asterisk/voicemail.conf.d/default/template.conf.erb'),
        notify  => Exec['asterisk-module-reload-app_voicemail.so'],
        require => File["${base}/${context}"],
    }

    if (!defined(File["$spool/${context}"])) {
        file { "$spool/${context}":
            ensure  => directory,
            require => File[$spool],
        }
    }

    file { "$spool/${context}/${name}":
        ensure  => directory,
        require => File["$spool/${context}"],
    }

    file { "$spool/${context}/${name}/secret.conf":
        ensure  => present,
        content => template('asterisk/var/spool/asterisk/voicemail/secret.conf.erb'),
        notify  => Exec['asterisk-module-reload-app_voicemail.so'],
        replace => false,
        require => File["$spool/${context}"],
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
