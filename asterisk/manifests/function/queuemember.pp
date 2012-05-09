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
define asterisk::function::queuemember(
    $queue,
    $channel = 'SIP',
) {
    require asterisk::server

    $base = "${asterisk::params::basedir}/queues.conf.d/includes"

    if (defined(File["${base}/${queue}"])) {
        file { "${base}/${queue}/${name}.conf":
            ensure  => present,
            content => template('asterisk/etc/asterisk/queues.conf.d/includes/default/template.conf.erb'),
            notify  => Exec['asterisk-module-reload-app_queue.so'],
            require => File["${base}/${queue}"],
        }
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
