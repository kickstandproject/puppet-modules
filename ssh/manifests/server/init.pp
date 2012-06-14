class ssh::server::init {
  include ssh::common::init
  include ssh::server::install
  include ssh::server::config
  include ssh::server::service
  include ssh::server::monitor
}

# vim:sw=2:ts=2:expandtab:textwidth=79
