class jenkins::common::config {
    require jenkins::params

    File {
        group   => $jenkins::params::configfile_group,
        mode    => $jenkins::params::configfile_mode,
        owner   => $jenkins::params::configfile_owner,
        require => Class['jenkins::common::install'],
    }

    file { $jenkins::params::defaultfile:
        ensure  => present,
        content => template('jenkins/server/etc/default/jenkins.erb'),
        notify  => Class['jenkins::common::service'],
    }
}
