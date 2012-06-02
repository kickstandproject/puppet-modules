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
define asterisk::voicemail::function::mailbox(
    $email = '',
    $fullname = '',
    $description = '',
) {
    require asterisk::voicemail::server

    /* XXX TODO Why do we need this here?  For some reason puppet will not honor
      existing one from asterisk::common::init. */
    File {
        group   => $asterisk::params::voicemail::group,
        mode    => $asterisk::params::voicemail::mode,
        owner   => $asterisk::params::voicemail::owner,
    }

    $split = split($name, '@')
    $extension = $split[0]
    if ($split[1] != '') {
        $context = $split[1]
    } else {
        $context = 'default'
    }

    $base = "${asterisk::params::basedir}/voicemail.conf.d"
    $spool = "${asterisk::params::spooldir}/voicemail"

    if (!defined(Common::Function::Concat["${base}/20${context}.conf"])) {
        common::function::concat { "${base}/20${context}.conf":
            notify => Exec['asterisk-module-reload-app_voicemail.so'],
        }

        common::function::concat::fragment { "20${context}.conf-header":
            target  => "${base}/20${context}.conf",
            content => template('asterisk/etc/asterisk/voicemail.conf.d/20mailboxes.conf.erb'),
            order   => 01,
        }
    }

    common::function::concat::fragment { "${extension}@${context}":
        target  => "${base}/20${context}.conf",
        content => template('asterisk/etc/asterisk/voicemail.conf.d/default/template.conf.erb'),
        order   => 02,
    }

    if (!defined(File["${spool}/${context}"])) {
        file { "${spool}/${context}":
            ensure  => directory,
            force   => true,
            notify  => Exec['asterisk-module-reload-app_voicemail.so'],
            purge   => true,
            recurse => true,
            require => File[$spool],
        }
    }

    file { "${spool}/${context}/${extension}":
        ensure  => directory,
        notify  => Exec['asterisk-module-reload-app_voicemail.so'],
        require => File["${spool}/${context}"],
    }

    file { "${spool}/${context}/${extension}/secret.conf":
        ensure  => present,
        content => template('asterisk/var/spool/asterisk/voicemail/secret.conf.erb'),
        notify  => Exec['asterisk-module-reload-app_voicemail.so'],
        replace => false,
        require => File["${spool}/${context}"],
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
