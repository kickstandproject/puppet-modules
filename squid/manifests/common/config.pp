class squid::common::config {
    File {
        group   => $squid::params::configfile_group,
        mode    => $squid::params::configfile_mode,
        owner   => $squid::params::configfile_owner,
    }

    file { $squid::params::configfile:
        ensure  => present,
        content => template('squid/server/etc/squid3/squid.conf.erb'),
        notify  => Class['squid::common::service'],
        require => Class['squid::common::install'],
    }
}
