class nagios::apache::install {
    require nagios::params

    package { $nagios::params::packagename_web:
        ensure  => present,
    }
}
