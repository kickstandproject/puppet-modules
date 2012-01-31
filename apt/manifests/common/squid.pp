class apt::common::squid {
    require squid::params

    File {
        ensure  => present,
        group   => $apt::params::configfile_group,
        mode    => $apt::params::configfile_mode,
        owner   => $apt::params::configfile_owner,
    }

    file { "${apt::params::configfile_dir}/99-proxy":
        ensure  => present,
        content => template('apt/client/etc/apt/apt.conf.d/99-proxy.erb'),
        require => File[$apt::params::configdir],
    }
}
