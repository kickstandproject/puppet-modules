class nagios::common::install {
    package { $nagios::params::packagename:
        ensure  => present,
    }

    package { $nagios::params::packagename_plugins:
        ensure  => present,
    }
}
