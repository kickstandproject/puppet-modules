class ssh::server::config {
  include ssh::common::config

  file { $ssh::params::server::configfile:
    content => template('ssh/etc/ssh/sshd_config.erb'),
    notify  => Class['ssh::server::service'],
    require => Class['ssh::server::install'],
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
