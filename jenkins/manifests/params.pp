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
class jenkins::params {
    $packagename = $operatingsystem ? {
        default => 'jenkins',
    }

    $servicename = $operatingsystem ? {
        default => 'jenkins',
    }

    $processname = $operatingsystem ? {
        default => 'jenkins',
    }

    $hasstatus = $operatingsystem ? {
        default => true,
    }

    $configfile = $operatingsystem ? {
        default => '/etc/ssh/sshd_config',
    }

    $configfile_mode = $operatingsystem ? {
        default => '0644',
    }

    $configfile_owner = $operatingsystem ? {
        default => 'root',
    }

    $configfile_group = $operatingsystem ? {
        default => 'root',
    }

    $configdir = $operatingsystem ? {
        default => '/var/lib/jenkins',
    }

    $defaultfile = $operatingsystem ? {
        default => '/etc/default/jenkins',
    }

    $port = $jenkins_port ? {
        ''      => '8080',
        default => $jenkins_port,
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
