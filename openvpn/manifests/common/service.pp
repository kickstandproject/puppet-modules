class openvpn::common::service {
    service { $openvpn::params::servicename:
        enable      => true,
        ensure      => running,
        hasrestart  => true,
        hasstatus   => $openvpn::params::hasstatus,
        require     => Class['openvpn::common::config'],
    }
}
