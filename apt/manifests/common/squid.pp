class apt::common::squid {
    require squid::params

    apt::function::config { '99-proxy':
        ensure  => present,
        content => template('apt/client/etc/apt/apt.conf.d/99-proxy.erb'),
    }
}
