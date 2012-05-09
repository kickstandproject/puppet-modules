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
class openssh::params {
    $packagename = $::operatingsystem ? {
        default => 'openssh-server',
    }

    $servicename = $::operatingsystem ? {
        default => 'ssh',
    }

    $processname = $::operatingsystem ? {
        default => 'sshd',
    }

    $hasstatus = $::operatingsystem ? {
        default => true,
    }

    $configfile = $::operatingsystem ? {
        default => '/etc/ssh/sshd_config',
    }

    $configfile_mode = $::operatingsystem ? {
        default => '0600',
    }

    $configfile_owner = $::operatingsystem ? {
        default => 'root',
    }

    $configfile_group = $::operatingsystem ? {
        default => 'root',
    }

    $configdir = $::operatingsystem ? {
        default => '/etc/ssh',
    }

    $port = $::openssh_port ? {
        ''      => '22',
        default => $::openssh_port,
    }

    $password_auth = $::openssh_password_auth ? {
        ''      => 'no',
        default => $::openssh_password_auth,
    }

    $permit_root = $::openssh_permit_root ? {
        ''      => 'no',
        default => $::openssh_permit_root,
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
