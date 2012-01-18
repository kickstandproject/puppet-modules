class openssh::common::install {
    package { $openssh::params::packagename:
        ensure  => present,
    }
}
