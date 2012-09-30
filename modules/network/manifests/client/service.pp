#
# kickstandproject-network: The Kickstand Project
#
# Copyright (C) 2012, PolyBeacon, Inc.
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
class network::client::service {
  service { $network::params::client::servicename:
    ensure      => 'stopped',
    enable      => true,
    hasrestart  => true,
    hasstatus   => $network::params::client::hasstatus,
    require     => Class['network::client::config'],
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
