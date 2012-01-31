class squid::common::service {
    service { $squid::params::servicename:
        enable      => true,
        ensure      => running,
        hasrestart  => true,
        hasstatus   => $squid::params::hasstatus,
        require     => Class['squid::common::config'],
    }
}
