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
define nagios::nsca::host(
    $address = 'localhost',
    $ensure = present,
    $server, 
    $use_active = 'generic-host-active',
    $use_passive = 'generic-host-passive'
    ) {
    require nagios::client

    nagios_host { $name:
        address => $address,
        ensure  => $ensure,
        notify  => Class['nagios::common::service'],
        target  => "${nagios::params::configdir}/hosts/${name}.cfg",
        use     => $use_active,
    }

    file { "${nagios::params::configdir}/hosts/${name}.cfg":
        ensure  => $ensure,
        mode    => $nagios::params::configfile_mode,
        owner   => $nagios::params::configfile_owner,
        group   => $nagios::params::configfile_group,
        before  => Nagios_host[$name],
    }

    @@nagios_host { "@@${name}":
        address     => $address ? {
            false   => $ipaddress,
            default => $address,
        },
        alias       => $name,
        ensure      => $ensure,
        host_name   => $name,
        notify      => Class['nagios::common::service'],
        tag         => $server,
        target      => "${nagios::params::configdir}/hosts/passive-${name}.cfg",
        use         => $use_passive,
    }

    @@file { "${nagios::params::configdir}/hosts/passive-${name}.cfg":
        ensure  => $ensure,
        group   => $nagios::params::configfile_group,
        mode    => $nagios::params::configfile_mode,
        owner   => $nagios::params::configfile_owner,
        tag     => $server,
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
