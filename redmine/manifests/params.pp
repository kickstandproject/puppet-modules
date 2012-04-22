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
class redmine::params {
    $basedir = $::operatingsystem ? {
        default => '/etc/redmine',
    }

    $configfile = $::operatingsystem ? {
        default => '/etc/glance/glance-registry.conf',
    }

    $group = $::operatingsystem ? {
        default => 'root',
    }

    $mode = $::operatingsystem ? {
        default => '0644',
    }

    $owner = $::operatingsystem ? {
        default => 'root',
    }

    $packagename = $::operatingsystem ? {
        default => 'redmine',
    }

    $processname = $::operatingsystem ? {
        default => 'redmine',
    }

    $db = $redmine_db ? {
        ''      => 'mysql',
        default => $redmine_db,
    }

    $db_name = $redmin_db_name ? {
        ''      => 'redmine',
        default => $redmine_db_name,
    }

    $db_password = $redmine_db_password ? {
        ''      => '',
        default => $redmine_db_password,
    }

    $db_server = $redmine_db_server ? {
        ''      => 'localhost',
        default => $redmin_db_server,
    }

    $db_user = $redmine_db_user ? {
        ''      => 'redmine',
        default => $redmine_db_user,
    }

    $sitename = $redmine_sitename ? {
        ''      => $fqdn,
        default => $redmine_sitename,
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
