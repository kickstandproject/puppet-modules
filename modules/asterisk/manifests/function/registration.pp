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
define asterisk::function::registration(
    $context,
    $secret,
    $domain = '',
    $extension = '',
    $template = 'ksp-itsp',
) {
    require asterisk::server

    $base = "${asterisk::params::basedir}/sip.conf.d/registrations"
    $ast_template = $template

    $split = split($name, '@')
    $user = $split[0]
    $host = $split[1]

    file { "$base/${name}.conf":
        ensure  => present,
        content => template('asterisk/etc/asterisk/sip.conf.d/registrations/template.conf.erb'),
        notify  => Exec['asterisk-module-reload-sip.conf'],
        require => File[$base],
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
