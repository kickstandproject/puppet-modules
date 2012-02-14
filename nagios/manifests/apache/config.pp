class nagios::apache::config {
    include nagios::params
    include apache::params

    file { "${nagios::params::basedir}/stylesheets":
        ensure  => directory,
        purge   => false,
        require => File[$nagios::params::basedir],
    }

    file { "${nagios::params::basedir}/cgi.cfg":
        ensure  => present,
        content => template('nagios/etc/nagios3/cgi.cfg.erb'),
        require => File[$nagios::params::basedir],
    }

    file { "${apache::params::configdir}/conf.d/nagios3.conf":
        ensure  => absent,
        require => Class['apache::common::config'],
    }

    apache::function::virtualhost { $fqdn:
        content => template('nagios/etc/apache2/conf.d/nagios3.conf.erb'),
    }
}
