class timezone::common::install {
    package { $timezone::params::packagename:
        ensure  => present,
    }
}
