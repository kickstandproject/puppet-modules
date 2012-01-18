class rsyslog::common::config {
    file { $rsyslog::params::configfile:
        ensure  => present,
        group   => $rsyslog::params::configfile_group,
        mode    => $rsyslog::params::configfile_mode,
        notify  => Class['rsyslog::common::service'],
        owner   => $rsyslog::params::configfile_owner,
        require => Class['rsyslog::common::install'],
    }

    if defined(Class['rsyslog::client']) {
        file[$rsyslog::params::configfile] {
            content => template('rsyslog/client/rsyslog.conf.erb'),
        }
    } else {
        file[$rsyslog::params::configfile] {
            content => template('rsyslog/server/rsyslog.conf.erb'),
        }
    }
}
