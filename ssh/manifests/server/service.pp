class ssh::server::service {
  include ssh::common::service

  service { $ssh::params::server::servicename:
    ensure      => running,
    enable      => true,
    hasrestart  => true,
    hasstatus   => $ssh::params::server::hasstatus,
    require     => Class['ssh::server::config'],
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
