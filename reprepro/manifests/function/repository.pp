define reprepro::function::repository(
    $ostype = 'ubuntu'
) {
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
    }

    file { "${reprepro::params::homedir}/${name}/${ostype}":
        ensure  => directory,
        require => File["$reprepro::params::homedir/${name}"],
        recurse => true,
    }

    file { [
        "${reprepro::params::homedir}/${name}/${ostype}/bin",
        "${reprepro::params::homedir}/${name}/${ostype}/db",
        "${reprepro::params::homedir}/${name}/${ostype}/dists",
        "${reprepro::params::homedir}/${name}/${ostype}/conf",
        "${reprepro::params::homedir}/${name}/${ostype}/incoming",
        "${reprepro::params::homedir}/${name}/${ostype}/logs",
        "${reprepro::params::homedir}/${name}/${ostype}/tmp"
    ]:
        ensure  => directory,
        require => File["${reprepro::params::homedir}/${name}/${ostype}"],
    }

    file { "${reprepro::params::homedir}/${name}/${ostype}/bin/build_sources":
        content => template('reprepro/server/var/lib/reprepro/bin/build_sources.erb'),
        mode    => '0755',
        require => File["${reprepro::params::homedir}/${name}/${ostype}/bin"],
    }

    file { "${reprepro::params::homedir}/${name}/${ostype}/conf/distributions":
        content => template('reprepro/server/var/lib/reprepro/conf/distributions.erb'),
        require => File["${reprepro::params::homedir}/${name}/${ostype}/conf"],
    }

    file { "${reprepro::params::homedir}/${name}/${ostype}/conf/incoming":
        content => template('reprepro/server/var/lib/reprepro/conf/incoming.erb'),
        require => File["${reprepro::params::homedir}/${name}/${ostype}/conf"],
    }

    /* XXX APT module? */
    file { "/etc/apt/sources.list.d/reprepro-${name}.list":
        content => template('reprepro/server/etc/apt/sources.list.d/reprepro.list.erb'),
        group   => root,
        owner   => root,
    }

    exec { "reprepro ${name} clearvanished":
        command     => "/usr/bin/reprepro -V -b ${reprepro::params::homedir}/${name}/${ostype} clearvanished",
        group       => $reprepro::params::user,
        refreshonly => true,
        require     => File["${reprepro::params::homedir}/${name}/${ostype}/db"],
        subscribe   => File["${reprepro::params::homedir}/${name}/${ostype}/conf/distributions"],
        user        => $reprepro::params::user,
    }

    exec { "reprepro ${name} export":
        command     => "/usr/bin/reprepro -V -b ${reprepro::params::homedir}/${name}/${ostype} export",
        group       => $reprepro::params::user,
        refreshonly => true,
        require     => File["${reprepro::params::homedir}/${name}/${ostype}/dists"],
        subscribe   => Exec["reprepro ${name} clearvanished"],
        user        => $reprepro::params::user,
    }

    cron { "reprepro ${name} processincoming":
        command => "/usr/bin/reprepro -V --keepunreferencedfiles -b ${reprepro::params::homedir}/${name}/${ostype} processincoming incoming",
        minute  => '*/5',
        require => User[$reprepro::params::user],
        user    => $reprepro::params::user,
    }
}
