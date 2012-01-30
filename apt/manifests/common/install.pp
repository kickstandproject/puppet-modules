class apt::common::install {
    package { $apt::params::packagename:
        ensure  => present,
    }
}
