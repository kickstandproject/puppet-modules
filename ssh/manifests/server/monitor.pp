class ssh::server::monitor {
  monitor::function::process { $name:
    description => 'SSH Server',
    process     => $ssh::params::server::processname,
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
