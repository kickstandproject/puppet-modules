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
define nagios::service::nsca (
    $check_command = false,
    $description,
    $ensure = 'present',
    $server,
    $use_active = 'generic-service-active',
    $use_passive = 'generic-service-passive'
) {
    require nagios::client
    include nagios::params

    nagios::service::local { $name:
        ensure          => $ensure,
        check_command   => $check_command,
        description     => $description,
        hostgroup_name  => 'all',
        use             => $use_active,
    }

    @@nagios_service { "@@${name} on ${hostname}":
        ensure              => $ensure,
        host_name           => $::fqdn,
        notify              => Class['nagios::common::service'],
        service_description => $description,
        tag                 => $server,
        target              => "${nagios::params::configdir}/services/passive/${name}.on.${hostname}.cfg",
        use                 => $use_passive,
    }

    @@file { "${nagios::params::configdir}/services/passive/${name}.on.${hostname}.cfg":
        ensure  => $ensure,
        group   => $nagios::params::configfile_group,
        mode    => $nagios::params::configfile_mode,
        owner   => $nagios::params::configfile_owner,
        tag     => $server,
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
