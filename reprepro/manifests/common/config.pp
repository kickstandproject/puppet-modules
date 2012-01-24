class reprepro::common::config {
    require reprepro::params

    File {
        group   => $reprepro::params::user,
        mode    => '0644',
        owner   => $reprepro::params::user,
    }

    user { $reprepro::params::user:
        ensure  => present,
        home    => $reprepro::params::homedir,
        system  => true,
    }

    file { $reprepro::params::homedir:
        ensure  => directory,
    }

    file { "${reprepro::params::homedir}/repos":
        ensure  => directory,
        require => File[$reprepro::params::homedir],
    }

    file { '/etc/sudoers.d/reprepro':
        ensure  => present,
        content => template('reprepro/server/etc/sudoers.d/reprepro.erb'),
        group   => 'root',
        mode    => '0440',
        owner   => 'root',
    }
}
