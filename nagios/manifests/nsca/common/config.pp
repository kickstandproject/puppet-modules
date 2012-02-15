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
class nagios::nsca::common::config {
    file { 'nagios_nsca.cfg':
        name    => $nagios::nsca::params::configfile,
        mode    => $nagios::nsca::params::configfile_mode,
        owner   => $nagios::nsca::params::configfile_owner,
        group   => $nagios::nsca::params::configfile_group,
        ensure  => present,
        content => template('nagios/nsca/nsca.cfg.erb'),
        require => Class['nagios::nsca::common::install'],
        notify  => Class['nagios::nsca::common::service'],
    }

    if defined(Class['nagios::nsca::client']) {
        file { 'nagios_nsca_send_nsca.cfg':
            name    => $nagios::nsca::params::configfile_client,
            mode    => $nagios::nsca::params::configfile_mode,
            owner   => $nagios::nsca::params::configfile_owner,
            group   => $nagios::nsca::params::configfile_group,
            ensure  => present,
            content => template('nagios/nsca/client/send_nsca.cfg.erb'),
            require => Class['nagios::nsca::common::install'],
        }
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
