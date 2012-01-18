class openssh::common::service {
    service { $openssh::params::servicename:
        enable      => true,
        ensure      => running,
        hasrestart  => true,
        hasstatus   => $openssh::params::hasstatus,
        require     => Class['openssh::common::config'],
    }
}
