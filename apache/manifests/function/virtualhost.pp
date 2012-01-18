define apache::function::virtualhost() {
    require apache::params

    file { "${apache::params::virtualhostdir}/${name}":
        content => template('apache/server/etc/apache2/sites-available/virtualhost.erb'),
        ensure  => present,
        group   => root,
        mode    => '0644',
        notify  => Class['apache::common::service'],
        owner   => root,
    }

    file { "${apache::params::rootdir}/${name}":
        ensure  => directory,
        group   => root,
        mode    => '0755',
        notify  => Class['apache::common::service'],
        owner   => root,
        require => File[$apache::params::rootdir],
    }

    file { "${apache::params::rootdir}/${name}/html":
        ensure  => directory,
        group   => root,
        mode    => '0755',
        notify  => Class['apache::common::service'],
        owner   => root,
        require => File["${apache::params::rootdir}/${name}"],
    }

    file { "${apache::params::logdir}/${name}":
        ensure  => directory,
        group   => root,
        mode    => '0750',
        notify  => Class['apache::common::service'],
        owner   => root,
    }

    file { ["${apache::params::logdir}/${name}/access.log",
        "${apache::params::logdir}/${name}/error.log"]:
        ensure  => present,
        group   => adm,
        mode    => '0640',
        notify  => Class['apache::common::service'],
        owner   => root,
        require => File["${apache::params::logdir}/${name}"],
    }

    exec { "apache_a2ensite_${name}":
        command => "/usr/sbin/a2ensite ${name}",
        creates => "${apache::params::configdir}/sites-enabled/${name}",
        notify  => Class['apache::common::service'],
        require => Class['apache::common::install'],
    }
}
