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
class nagios::nsca::client inherits nagios::nsca::common::init {
    require nagios::params

    File {
        mode    => '0644',
        owner   => $nagios::params::configfile_owner,
        group   => $nagios::params::configfile_group,
    }

    nagios_command { 'submit_ocsp':
        ensure          => present,
        command_line    => "${nagios::params::plugindir}/submit_ocsp \$HOSTNAME\$ '\$SERVICEDESC\$' \$SERVICESTATEID\$ '\$SERVICEOUTPUT\$'",
        target          => "${nagios::params::configdir}/commands/submit_ocsp.cfg",
        notify          => Class['nagios::common::service'],
        require         => File["${nagios::params::configdir}/commands/submit_ocsp.cfg"],
    }

    file { "${nagios::params::configdir}/commands/submit_ocsp.cfg":
        ensure  => present,
        require => File["${nagios::params::configdir}/commands"],
    }

    nagios_command { 'submit_ochp':
        ensure          => present,
        command_line    => "${nagios::params::plugindir}/submit_ochp \$HOSTNAME\$ \$HOSTSTATE\$ '\$HOSTOUTPUT\$'",
        target          => "${nagios::params::configdir}/commands/submit_ochp.cfg",
        notify          => Class['nagios::common::service'],
        require         => File["${nagios::params::configdir}/commands/submit_ochp.cfg"],
    }

    file { "${nagios::params::configdir}/commands/submit_ochp.cfg":
        ensure  => present,
        require => File["${nagios::params::configdir}/commands"],
    }

    file { "${nagios::params::plugindir}/submit_ocsp":
        content => template('nagios/nsca/client/submit_ocsp.erb'),
        ensure  => present,
        mode    => '0755',
        require => File[$nagios::params::plugindir],
    }

    file { "${nagios::params::plugindir}/submit_ochp":
        content => template('nagios/nsca/client/submit_ochp.erb'),
        ensure  => present,
        mode    => '0755',
        require => File[$nagios::params::plugindir],
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
