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
define nagios::service::local (
    $description,
    $check_command = false,
    $ensure = present,
    $hostgroup_name = 'all',
    $use = 'generic-service-active'
) {
    require nagios::client
    include nagios::params

    nagios_service { $name:
        ensure              => $ensure,
        check_command       => $check_command ? {
            false   => $name,
            default => $check_command,
        },
        hostgroup_name      => $hostgroup_name,
        notify              => Class['nagios::common::service'],
        require             => File["${nagios::params::configdir}/services"],
        service_description => $description,
        target              => "${nagios::params::configdir}/services/${name}.cfg",
        use                 => $use,
    }

    file { "${nagios::params::configdir}/services/${name}.cfg":
        ensure  => $ensure,
        before  => Nagios_service[$name],
        require => File["${nagios::params::configdir}/services"],
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
