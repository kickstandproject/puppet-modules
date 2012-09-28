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
class rsyslog::common::mysql {
    require mysql::params

    if ($rsyslog::params::db_server == 'localhost') {
        require mysql::server
    }

    package { $rsyslog::params::packagename_mysql:
        ensure          => present,
        responsefile    => '/var/local/preseed/rsyslog-mysql.preseed',
        require         => File['/var/local/preseed/rsyslog-mysql.preseed'],
    }

    file { "${rsyslog::params::configdir}/mysql.conf":
        ensure  => present,
        content => template('rsyslog/server/mysql.conf.erb'),
        group   => $rsyslog::params::configfile_group,
        mode    => $rsyslog::params::configfile_mode,
        notify  => Class['rsyslog::common::service'],
        owner   => $rsyslog::params::configfile_owner,
        require => Class['rsyslog::common::install'],
    }

    file { '/var/local/preseed/rsyslog-mysql.preseed':
        content => template('rsyslog/server/rsyslog-mysql.preseed.erb'),
        group   => root,
        mode    => '0400',
        owner   => root,
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
