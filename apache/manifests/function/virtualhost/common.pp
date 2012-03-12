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
#
define apache::function::virtualhost::common(
    content = ''
) {
    require apache::server

    file { "${apache::params::virtualhostdir}/${name}":
        ensure  => present,
        content => template('apache/etc/apache2/sites-available/virtualhost.erb'),
        notify  => Class['apache::common::service'],
    }

    file { "${apache::params::rootdir}/${name}":
        ensure  => directory,
        purge   => true,
        notify  => Class['apache::common::service'],
        recurse => true,
        require => File[$apache::params::rootdir],
    }

    file { "${apache::params::rootdir}/${name}/conf":
        ensure  => directory,
        purge   => true,
        notify  => Class['apache::common::service'],
        recurse => true,
        require => File["${apache::params::rootdir}/${name}"],
    }

    file { "${apache::params::rootdir}/${name}/html":
        ensure  => directory,
        notify  => Class['apache::common::service'],
        require => File["${apache::params::rootdir}/${name}"],
    }

    file { "${apache::params::logdir}/${name}":
        ensure  => directory,
        group   => root,
        mode    => '0750',
        notify  => Class['apache::common::service'],
        owner   => root,
    }

    file { ["${apache::params::logdir}/${name}/access.log",
        "${apache::params::logdir}/${name}/error.log"]:
        ensure  => present,
        group   => adm,
        mode    => '0640',
        notify  => Class['apache::common::service'],
        owner   => root,
        require => File["${apache::params::logdir}/${name}"],
    }

    exec { "apache_a2ensite_${name}":
        command => "/usr/sbin/a2ensite ${name}",
        creates => "${apache::params::basedir}/sites-enabled/${name}",
        notify  => Class['apache::common::service'],
        require => File["${apache::params::basedir}/sites-enabled"],
    }

    if ($content != '') {
        file { "${apache::params::rootdir}/${name}/conf/${name}.conf":
            ensure  => present,
            content => $content,
            notify  => Class['apache::common::service'],
            require => File["${apache::params::rootdir}/${name}"],
        }
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
