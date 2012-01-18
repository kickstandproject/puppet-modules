class rsyslog::common::install {
    package { $rsyslog::params::packagename:
        ensure  => present,
    }
}
