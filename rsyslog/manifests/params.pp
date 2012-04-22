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
class rsyslog::params {
    $packagename = $::operatingsystem ? {
        default => 'rsyslog-relp',
    }

    $packagename_mysql = $::operatingsystem ? {
        default => 'rsyslog-mysql',
    }

    $servicename = $::operatingsystem ? {
        default => 'rsyslog',
    }

    $processname = $::operatingsystem ? {
        default => 'rsyslogd',
    }

    $hasstatus = $::operatingsystem ? {
        default => true,
    }

    $configfile = $::operatingsystem ? {
        default => '/etc/rsyslog.conf',
    }

    $configfile_mode = $::operatingsystem ? {
        default => '0644',
    }

    $configfile_owner = $::operatingsystem ? {
        default => 'root',
    }

    $configfile_group = $::operatingsystem ? {
        default => 'root',
    }

    $configdir = $::operatingsystem ? {
        default => '/etc/rsyslog.d',
    }

    $db = $rsyslog_db ? {
        mysql   => 'mysql',
        default => '',
    }

    $db_name = $rsyslog_db_name ? {
        ''      => 'Syslog',
        default => $rsyslog_db_name,
    }

    /* XXX TODO Fixme! */
    $db_password = $rsyslog_db_password ? {
        ''      => 'bob',
        default => $rsyslog_db_password,
    }

    $db_server = $rsyslog_db_server ? {
        ''      => 'localhost',
        default => $rsyslog_db_server,
    }

    $db_user = $rsyslog_db_user ? {
        ''      => 'rsyslog',
        default => $rsyslog_db_user,
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
