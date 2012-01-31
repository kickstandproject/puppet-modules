class squid::common::install {
    package { $squid::params::packagename:
        ensure  => present,
    }
}
