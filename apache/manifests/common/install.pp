class apache::common::install {
    package { $apache::params::packagename:
        ensure  => present,
    }
}
