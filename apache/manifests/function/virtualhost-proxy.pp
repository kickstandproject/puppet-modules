define apache::function::virtualhost-proxy(
) {
    require apache::params

    apache::function::virtualhost::common { $name:
    }

    file { "${apache::params::rootdir}/${name}/conf/proxy.conf":
        content => template('apache/server/etc/apache2/sites-available/virtualhost-proxy.conf.erb'),
        ensure  => present,
        notify  => Class['apache::common::service'],
        require => File["${apache::params::rootdir}/${name}/conf"],
    }

    /* XXX TODO This should be a function!! */
    exec { "apache_a2enmod_proxy_http":
        command => "/usr/sbin/a2enmod proxy_http",
        creates => "${apache::params::configdir}/mods-enabled/proxy_http.load",
        notify  => Class['apache::common::service'],
        require => Class['apache::common::install'],
    }

}
