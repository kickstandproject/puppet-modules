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
define apache::function::virtualhost-proxy(
    $host = 'localhost',
    $port
) {
    require apache::params

    apache::function::virtualhost::common { $name:
    }

    file { "${apache::params::rootdir}/${name}/conf/proxy.conf":
        content => template('apache/etc/apache2/sites-available/virtualhost-proxy.conf.erb'),
        ensure  => present,
        notify  => Class['apache::common::service'],
        require => File["${apache::params::rootdir}/${name}/conf"],
    }

    /* XXX TODO This should be a function!! */
    exec { "apache_a2enmod_proxy_http":
        command => "/usr/sbin/a2enmod proxy_http",
        creates => "${apache::params::configdir}/mods-enabled/proxy_http.load",
        notify  => Class['apache::common::service'],
        require => Class['apache::common::install'],
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
