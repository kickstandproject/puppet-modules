class asterisk::common::service {
    service { $asterisk::params::servicename:
        enable      => true,
        ensure      => running,
        hasrestart  => true,
        hasstatus   => $asterisk::params::hasstatus,
    }
}
