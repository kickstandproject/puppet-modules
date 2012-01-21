class jenkins::common::service {
    service { $jenkins::params::servicename:
        enable      => true,
        ensure      => running,
        hasrestart  => true,
        hasstatus   => $jenkins::params::hasstatus,
        require     => Class['jenkins::common::config'],
    }
}
