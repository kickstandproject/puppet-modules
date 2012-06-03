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
define asterisk::function::sip::device(
    $extension,
    $fullname,
    $secret,
    $email      = '',
    $options    = {},
) {
    require asterisk::server

    $base = "${asterisk::params::basedir}/sip.conf.d/devices"

    $defaults = {
        'type'          => 'friend',
        'host'          => 'dynamic',
        'context'       => 'from-internal',
    }

    $options_real = merge($defaults, $options)

    if (!$options_real['description']) {
        $options_real['description'] = "${fullname} <${extension}>"
    }

    if (!$options_real['callerid']) {
        $options_real['callerid'] = "${fullname} <${extension}>"
    }

    if (!$options_real['mailbox']) {
        $options_real['mailbox'] = "${extension}@${options_real['context']}"
    }

    $split = split($name, '-')

    if ($split[1] != '') {
        $line = $split[1]
    } else {
        $line = '1'
    }

    $name_real = "${split[0]}-${line}"
    $options_real['md5secret'] = md5("${name_real}:asterisk:${secret}")

    common::function::concat::fragment { $name:
        target  => "${asterisk::params::server::basedir}/sip.conf.d/20devices.conf",
        content => template('asterisk/etc/asterisk/sip.conf.d/20devices2.conf.erb'),
        notify  => Exec["asterisk-database-put-${name_real}"],
        order   => 02,
    }

    exec { "asterisk-database-put-${name_real}":
        command     => "asterisk -rx \"database put ${channel}/Device ${extension}@${context} ${name_real}\"",
        refreshonly => true,
    }

    if ($options_real['mailbox'] != 'none') {
        asterisk::voicemail::function::mailbox { $options_real['mailbox']:
            description => $options_real['description'],
            email       => $email,
            fullname    => $fullname,
        }
    }

/*

    if ($queues != '') {
        asterisk::function::queuemember { $name_real:
            channel => $channel,
            queue   => $queues,
        }
    }
*/
}

# vim:sw=4:ts=4:expandtab:textwidth=79
