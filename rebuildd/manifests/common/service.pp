class rebuildd::common::service {
    service { $rebuildd::params::servicename:
        enable      => true,
        ensure      => running,
        hasrestart  => $rebuildd::params::hasrestart,
        hasstatus   => $rebuildd::params::hasstatus,
        require     => Class['rebuildd::common::config'],
    }
}
