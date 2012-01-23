define reprepro::function::repository() {
    require reprepro::server
    require reprepro::params

    File {
        group   => $reprepro::params::user,
        mode    => '0644',
        owner   => $reprepro::params::user,
    }

    file { "${reprepro::params::homedir}/${name}":
        ensure  => directory,
        require => File[$reprepro::params::homedir],
        recurse => true,
    }

    file { [
        "${reprepro::params::homedir}/${name}/bin",
        "${reprepro::params::homedir}/${name}/db",
        "${reprepro::params::homedir}/${name}/dists",
        "${reprepro::params::homedir}/${name}/conf",
        "${reprepro::params::homedir}/${name}/incoming",
        "${reprepro::params::homedir}/${name}/logs",
        "${reprepro::params::homedir}/${name}/tmp"
    ]:
        ensure  => directory,
        require => File["${reprepro::params::homedir}/${name}"],
    }

    file { "${reprepro::params::homedir}/${name}/bin/build_sources":
        content => template('reprepro/server/var/lib/reprepro/bin/build_sources.erb'),
        mode    => '0755',
        require => File["${reprepro::params::homedir}/${name}/bin"],
    }

    file { "${reprepro::params::homedir}/${name}/conf/distributions":
        content => template('reprepro/server/var/lib/reprepro/conf/distributions.erb'),
        require => File["${reprepro::params::homedir}/${name}/conf"],
    }

    file { "${reprepro::params::homedir}/${name}/conf/incoming":
        content => template('reprepro/server/var/lib/reprepro/conf/incoming.erb'),
        require => File["${reprepro::params::homedir}/${name}/conf"],
    }

    /* XXX APT module? */
    file { "/etc/apt/sources.list.d/reprepro-${name}.list":
        content => template('reprepro/server/etc/apt/sources.list.d/reprepro.list.erb'),
        group   => root,
        owner   => root,
    }

    exec { "reprepro ${name} clearvanished":
        command     => "/usr/bin/reprepro -V -b ${reprepro::params::homedir}/${name} clearvanished",
        group       => $reprepro::params::user,
        refreshonly => true,
        require     => File["${reprepro::params::homedir}/${name}/db"],
        subscribe   => File["${reprepro::params::homedir}/${name}/conf/distributions"],
        user        => $reprepro::params::user,
    }

    exec { "reprepro ${name} export":
        command     => "/usr/bin/reprepro -V -b ${reprepro::params::homedir}/${name} export",
        group       => $reprepro::params::user,
        refreshonly => true,
        require     => File["${reprepro::params::homedir}/${name}/dists"],
        subscribe   => Exec["reprepro ${name} clearvanished"],
        user        => $reprepro::params::user,
    }

    cron { "reprepro ${name} processincoming":
        command => "/usr/bin/reprepro -V --keepunreferencedfiles -b ${reprepro::params::homedir}/${name} processincoming incoming",
        minute  => '*/5',
        require => User[$reprepro::params::user],
        user    => $reprepro::params::user,
    }
}
