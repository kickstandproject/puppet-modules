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
class openstack::glance::params {
    $packagename = $operatingsystem ? {
        default => 'glance',
    }

    $servicename = $operatingsystem ? {
        default => 'glance-registry',
    }

    $processname = $operatingsystem ? {
        default => 'glance-registry',
    }

    $hasstatus = $operatingsystem ? {
        default => true,
    }

    $configfile_registry = $operatingsystem ? {
        default => '/etc/glance/glance-registry.conf',
    }

    $configfile_mode = $operatingsystem ? {
        default => '644',
    }

    $configfile_owner = $operatingsystem ? {
        default => 'root',
    }

    $configfile_group = $operatingsystem ? {
        default => 'root',
    }

    $configdir = $operatingsystem ? {
        default => '/etc/glance',
    }

    $db = $openstack_glance_db ? {
        ''  => 'sqlite',
        default => "$openstack_glance_db"
        }

    $db_name = $openstack_glance_db_name ? {
        ''  => 'glance',
        default => "$openstack_glance_db_name",
    }

    $db_password = $openstack_glance_db_password ? {
        ''  => 'bob',
        default => "$openstack_glance_db_password",
    }

    $db_server = $openstack_glance_db_server ? {
        ''  => 'localhost',
        default => "$openstack_glance_db_server",
    }

    $db_user = $openstack_glance_db_user ? {
        ''  => 'glancedbadmin',
        default => "$openstack_glance_db_user",
    }

    $python_mysqldb = $operatingsystem ? {
        default => "python-mysqldb",
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
