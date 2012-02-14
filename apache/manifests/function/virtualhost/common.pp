define apache::function::virtualhost::common(
    content = ''
) {
    require apache::server

    File {
        group   => $apache::params::configfile_group,
        mode    => $apache::params::configfile_mode,
        owner   => $apache::params::configfile_owner,
    }

    file { "${apache::params::virtualhostdir}/${name}":
        ensure  => present,
        content => template('apache/server/etc/apache2/sites-available/virtualhost.erb'),
        notify  => Class['apache::common::service'],
    }

    file { "${apache::params::rootdir}/${name}":
        ensure  => directory,
        purge   => true,
        notify  => Class['apache::common::service'],
        recurse => true,
        require => File[$apache::params::rootdir],
    }

    file { "${apache::params::rootdir}/${name}/conf":
        ensure  => directory,
        purge   => true,
        notify  => Class['apache::common::service'],
        recurse => true,
        require => File["${apache::params::rootdir}/${name}"],
    }

    file { "${apache::params::rootdir}/${name}/html":
        ensure  => directory,
        notify  => Class['apache::common::service'],
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

    if ($content != '') {
        file { "${apache::params::rootdir}/${name}/conf/${name}.conf":
            ensure  => present,
            content => $content,
            notify  => Class['apache::common::service'],
            require => File["${apache::params::rootdir}/${name}"],
        }
    }
}
