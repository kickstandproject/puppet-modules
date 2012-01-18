class asterisk::common::install {
    package { $asterisk::params::packagename:
        ensure  => present,
    }
}
