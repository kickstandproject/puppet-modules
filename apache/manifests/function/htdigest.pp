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
define apache::function::htdigest(
    $authname = 'default',
    $location,
    $password,
    $username
) {
    require apache::params

    apache::function::a2enmod { 'auth_digest':
    }

    file { "${apache::params::rootdir}/${name}/conf/htdigest.conf":
        content => template('apache/etc/apache2/conf.d/htdigest.conf.erb'),
        ensure  => present,
        notify  => Class['apache::common::service'],
        require => File["${apache::params::rootdir}/${name}/conf"],
    }

    $md5password = md5("${username}:${authname}:${password}")

    file { "${apache::params::rootdir}/${name}/conf/.htdigest":
        content => template('apache/etc/apache2/conf.d/htdigest.erb'),
        ensure  => present,
        notify  => Class['apache::common::service'],
        require => File["${apache::params::rootdir}/${name}/conf/htdigest.conf"],
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
