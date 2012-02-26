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
define apache::function::htpasswd(
    $ensure = 'present',
    $password,
    $path,
    $username
) {
    exec { 'htpasswd -cb':
        command => "/usr/bin/htpasswd -cb ${path} ${username} ${password}",
        creates => $path,
        notify  => Class['apache::common::service'],
        require => Class['apache::common::install'],
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
