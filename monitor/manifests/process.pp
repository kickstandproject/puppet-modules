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
define monitor::process(
    $ensure = present,
    $process
    ) {
    require nagios::nsca::params

    File {
        group   => $nagios::nsca::params::configfile_group,
        mode    => $nagios::nsca::params::configfile_mode,
        owner   => $nagios::nsca::params::configfile_owner,
    }

    if ($fqdn != $nagios_nsca_server) {
        nagios::service::nsca { "check_procs_${process}!1!1":
            description => "Check Process ${process}",
            ensure      => $ensure,
            server      => $nagios::nsca::params::server,
        }
    }

    nagios::command { "check_procs_${process}":
        command_line    => "/usr/lib/nagios/plugins/check_procs -C ${process} -w '\$ARG1$:' -c '\$ARG2$:'"
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
