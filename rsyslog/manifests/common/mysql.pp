class rsyslog::common::mysql {
    require mysql::params

    if ($rsyslog::params::db_server == 'localhost') {
        require mysql::server
    }

    package { $rsyslog::params::packagename_mysql:
        ensure          => present,
        responsefile    => '/var/local/preseed/rsyslog-mysql.preseed',
        require         => File['/var/local/preseed/rsyslog-mysql.preseed'],
    }

    file { "${rsyslog::params::configdir}/mysql.conf":
        content => template('rsyslog/server/mysql.conf.erb'),
        ensure  => present,
        group   => $rsyslog::params::configfile_group,
        mode    => $rsyslog::params::configfile_mode,
        notify  => Class['rsyslog::common::service'],
        owner   => $rsyslog::params::configfile_owner,
        require => Class['rsyslog::common::install'],
    }

    file { '/var/local/preseed/rsyslog-mysql.preseed':
        content => template('rsyslog/server/rsyslog-mysql.preseed.erb'),
        group   => root,
        mode    => '0400',
        owner   => root,
    }
}
