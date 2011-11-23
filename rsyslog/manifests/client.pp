class rsyslog::client inherits rsyslog::classes::common {
        file { 'rsyslog.conf':
                content => template('rsyslog/client/rsyslog.conf.erb'),
        }
}
