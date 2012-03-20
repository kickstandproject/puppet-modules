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
define asterisk::function::device(
    callerid = '',
    channel = 'SIP',
    context,
    description,
    extension,
    host = 'dynamic',
    mailbox = '',
    secret,
    template = '',
    type = 'friend'
) {
    require asterisk::server

    $ast_type = $type
    $ast_template = $template
    $base = "${asterisk::params::basedir}/sip.conf.d/devices"

    $md5secret = md5("${name}:asterisk:${secret}")

    file { "$base/${name}.conf":
        ensure  => present,
        content => template('asterisk/etc/asterisk/sip.conf.d/devices/template.conf.erb'),
        notify  => Exec['asterisk-module-reload-chan_sip.so'],
        require => File[$base],
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
