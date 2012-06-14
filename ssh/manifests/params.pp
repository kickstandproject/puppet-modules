class ssh::params {
  $basedir = $::operatingsystem ? {
    default => '/etc/ssh',
  }

  $group = $::operatingsystem ? {
    default => 'root',
  }

  $mode = $::operatingsystem ? {
    default => '0600',
  }

  $owner = $::operatingsystem ? {
    default => 'root',
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
