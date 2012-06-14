class ssh::common::init {
  File {
    group => $ssh::params::group,
    mode  => $ssh::params::mode,
    owner => $ssh::params::owner,
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
