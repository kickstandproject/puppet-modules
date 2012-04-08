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
define polycom-provision::function::phone(
    label = '',
    password
) {
    require polycom-provision::server

    file { "${polycom-provision::params::basedir}/configs/${name}-user.cfg":
        ensure  => present,
        content => template('polycom-provision/var/lib/polycom-provision/configs/template.cfg.erb'),
        notify  => Exec["asterisk-sip-notify-${name}"],
        require => File["${polycom-provision::params::basedir}/configs"],
    }

    exec { "asterisk-sip-notify-${name}":
        command     => "asterisk -rx \"sip notify polycom-check-cfg ${name}-1\"",
        refreshonly => true,
        subscribe   => [
            Class['polycom-provision::common::config'],
            File["${polycom-provision::params::basedir}/site.cfg"],
            File["${polycom-provision::params::basedir}/sip-basic.cfg"],
        ],
        

    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
