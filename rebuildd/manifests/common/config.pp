class rebuildd::common::config {
    require pbuilder::client
    require rebuildd::params

    File {
        ensure  => present,
        group   => $rebuildd::params::configfile_group,
        mode    => $rebuildd::params::configfile_mode,
        notify  => Class['rebuildd::common::service'],
        owner   => $rebuildd::params::configfile_owner,
        require => Class['rebuildd::common::install'],
    }

    file { $rebuildd::params::configfile:
        content => template("rebuildd/server/etc/rebuildd/rebuilddrc.erb"),
    }

    file { $rebuildd::params::defaultsfile:
        content => template("rebuildd/server/etc/default/rebuildd.erb"),
    }

    exec { 'rebuildd-create-database':
        command => '/usr/sbin/rebuildd init',
        creates => '/var/lib/rebuildd/rebuildd.db',
    }
}
