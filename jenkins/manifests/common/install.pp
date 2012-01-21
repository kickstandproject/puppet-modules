class jenkins::common::install {
    package { $jenkins::params::packagename:
        ensure  => present,
    }
}
