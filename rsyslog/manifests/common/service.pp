class rsyslog::common::service {
    service { $rsyslog::params::servicename:
        enable      => true,
        ensure      => running,
        hasrestart  => true,
        hasstatus   => $rsyslog::params::hasstatus,
        require     => Class['rsyslog::common::config'],
    }
}
