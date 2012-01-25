class apache::common::config {
    File {
        group   => $apache::params::configfile_group,
        mode    => $apache::params::configfile_mode,
        owner   => $apache::params::configfile_owner,
        require => Class['apache::common::install'],
    }

    file { $apache::params::defaultfile:
        content => template('apache/server/etc/default/apache2.erb'),
        ensure  => present,
    }

    file { $apache::params::rootdir:
        ensure  => directory,
    }

    file { "${apache::params::rootdir}/index.html":
        ensure  => absent,
        require => File[$apache::params::rootdir],
    }

    exec { "apache_a2dissite_default":
        command => "/usr/sbin/a2dissite default",
        onlyif => "/usr/bin/test -f ${apache::params::configdir}/sites-enabled/000-default",
        notify  => Class['apache::common::service'],
        require => Class['apache::common::install'],
    }
}
