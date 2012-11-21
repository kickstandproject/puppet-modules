class git::client::install {
  package { $git::params::client::packagename:
    ensure => present,
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
