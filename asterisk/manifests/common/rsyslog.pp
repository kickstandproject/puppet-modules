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
class asterisk::common::rsyslog {
    require rsyslog::client

    file { "${rsyslog::params::configdir}/99-asterisk.conf":
        content => template('asterisk/99-asterisk.conf.erb'),
        ensure  => present,
        group   => $rsyslog::params::configfile_group,
        mode    => $rsyslog::params::configfile_mode,
        notify  => Class['rsyslog::common::service'],
        owner   => $rsyslog::params::configfile_owner,
        require => Class['rsyslog::client'],
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
