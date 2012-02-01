class openvpn::common::config {
    File {
        group   => $openvpn::params::configfile_group,
        mode    => $openvpn::params::configfile_mode,
        owner   => $openvpn::params::configfile_owner,
    }

    file { $openvpn::params::configdir:
        ensure  => directory,
        require => Class['openvpn::common::install'],
    }

    file { $openvpn::params::defaultfile:
        ensure  => present,
        content => template('openvpn/server/etc/default/openvpn.erb'),
        notify  => Class['openvpn::common::service'],
    }
}
