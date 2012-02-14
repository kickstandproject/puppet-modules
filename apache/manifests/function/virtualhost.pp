define apache::function::virtualhost(
    content = ''
) {
    require apache::params

    apache::function::virtualhost::common { $name:
	content    => $content,
    }

    file { "${apache::params::rootdir}/${name}/conf/default.conf":
        content => template('apache/server/etc/apache2/sites-available/virtualhost-default.conf.erb'),
        ensure  => present,
        notify  => Class['apache::common::service'],
        require => File["${apache::params::rootdir}/${name}/conf"],
    }
}
