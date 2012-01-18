class ntp::common::config {
    file { $ntp::params::configfile:
        mode    => $ntp::params::configfile_mode,
        owner   => $ntp::params::configfile_owner,
        group   => $ntp::params::configfile_group,
        ensure  => present,
        content => template('ntp/ntp.conf.erb'),
        require => Class['ntp::common::install'],
        notify  => Class['ntp::common::service'],
    }
}
