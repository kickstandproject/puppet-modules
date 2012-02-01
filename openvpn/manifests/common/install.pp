class openvpn::common::install {
    package { $openvpn::params::packagename:
        ensure  => present,
    }
}
