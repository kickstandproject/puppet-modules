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
class nagios::web::params {
    $configfile = $::operatingsystem ? {
        default => '/etc/nagios3/nagios.cfg',
    }

    $group = $::operatingsystem ? {
        default => 'root',
    }

    $hasstatus = $::operatingsystem ? {
        default => true,
    }

    $mode = $::operatingsystem ? {
        default => '0644',
    }

    $owner = $::operatingsystem ? {
        default => 'root',
    }

    $packagename = $::operatingsystem ? {
        default => 'nagios3-cgi',
    }

    $hostname = $::nagios_web_hostname ? {
        ''      => $::fqdn,
        default => $::nagios_web_hostname,
    }

    $password = $::nagios_web_password ? {
        ''      => '',
        default => $::nagios_web_password,
    }

    $username = $::nagios_web_username ? {
        ''      => 'nagiosadmin',
        default => $::nagios_web_username,
    }

    if ($nagios::web::params::password == '') {
        fail('You must assign a default password using \'\$::nagios_web_password\'')
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
