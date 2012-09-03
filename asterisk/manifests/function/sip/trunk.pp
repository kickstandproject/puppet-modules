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
define asterisk::function::sip::trunk(
    $options    = {},
) {
    require asterisk::server

    $defaults = {
        'type'      => 'peer',
        'host'      => 'dynamic',
        'context'   => 'from-itsp',
        'template'  => 'ksp-itsp'
    }

    $options_real = merge($defaults, $options)
    $name_real = $name

    if ($options_real['secret']) {
        $options_real['md5secret'] = md5("${name}:asterisk:${options_real['secret']}")
    }


    file { "${asterisk::params::server::basedir}/sip.conf.d/trunks/${name}.conf":
        ensure  => present,
        content => template('asterisk/etc/asterisk/sip.conf.d/trunks/template.conf.erb'),
        notify  => Exec['asterisk-module-reload-sip.conf'],
        require => File["${asterisk::params::server::basedir}/sip.conf.d/trunks"],
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
