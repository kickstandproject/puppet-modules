class ssh::server::install {
  include ssh::common::install

  package { $ssh::params::server::packagename:
    ensure  => present,
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
