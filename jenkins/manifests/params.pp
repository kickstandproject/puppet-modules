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
    $basedir = $::operatingsystem ? {
        default => '/var/lib/jenkins',
    }

    $defaultfile = $::operatingsystem ? {
        default => '/etc/default/jenkins',
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
        default => 'jenkins',
    }

    $processname = $::operatingsystem ? {
        default => 'jenkins',
    }

    $servicename = $::operatingsystem ? {
        default => 'jenkins',
    }

    $hostname = $jenkins_hostname ? {
        ''      => $fqdn,
        default => $jenkins_hostname,
    }

    $port = $jenkins_port ? {
        ''      => '8080',
        default => $jenkins_port,
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
