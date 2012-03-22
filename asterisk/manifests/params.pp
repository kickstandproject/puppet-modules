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
class asterisk::params {
    $basedir = $operatingsystem ? {
        default => '/etc/asterisk',
    }

    $group = $operatingsystem ? {
        default => 'asterisk',
    }

    $hasrestart = $operatingsystem ? {
        default => true,
    }

    $hasstatus = $operatingsystem ? {
        default => true,
    }

    $mode = $operatingsystem ? {
        default => '0640',
    }

    $owner = $operatingsystem ? {
        default => 'asterisk',
    }

    $packagename = $operatingsystem ? {
        default => 'asterisk',
    }

    $processname = $operatingsystem ? {
        default => 'asterisk',
    }

    $servicename = $operatingsystem ? {
        default => 'asterisk',
    }

    $spooldir = $operatingsystem ? {
        default => '/var/spool/asterisk',
    }

    $voicemail = $asterisk_voicemail ? {
        ''      => false,
        'yes'   => true,
        default => $asterisk_voicemail,
    }

    $sip_port = $asterisk_sip_port ? {
        ''      => '5060',
        default => $asterisk_sip_port,
    }

    $externaddr = $asterisk_externaddr ? {
        ''      => false,
        default => $asterisk_externaddr,
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
