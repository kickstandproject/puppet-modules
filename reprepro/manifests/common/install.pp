class reprepro::common::install {
    package { $reprepro::params::packagename:
        ensure  => present,
    }
}
