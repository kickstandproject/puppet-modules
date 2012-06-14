class ssh::common::config {
  file { $ssh::params::basedir:
    ensure  => directory,
    require => Class['ssh::common::install'],
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
