class ssh::params::server inherits ssh::params {
  $configfile = $::operatingsystem ? {
    default => '/etc/ssh/sshd_config',
  }

  $hasstatus = $::operatingsystem ? {
    default => true,
  }

  $packagename = $::operatingsystem ? {
    default => 'openssh-server',
  }

  $processname = $::operatingsystem ? {
    default => 'sshd',
  }

  $servicename = $::operatingsystem ? {
    default => 'ssh',
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
