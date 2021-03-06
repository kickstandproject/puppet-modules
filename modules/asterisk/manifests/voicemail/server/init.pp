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
class asterisk::voicemail::server::init {
    include asterisk::voicemail::server::install
    include asterisk::voicemail::server::config
    include asterisk::voicemail::server::command

    File {
        group   => $asterisk::params::voicemail::group,
        mode    => $asterisk::params::voicemail::mode,
        owner   => $asterisk::params::voicemail::owner,
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
