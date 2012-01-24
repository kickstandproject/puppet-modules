define reprepro::function::repository(
    $ostype = 'ubuntu',
    $project = 'default'
) {
    require reprepro::server
    require reprepro::params

    File {
        group   => $reprepro::params::user,
        mode    => '0644',
        owner   => $reprepro::params::user,
    }

    if (!defined(File["${reprepro::params::homedir}/repos/${project}"])) {
        file { "${reprepro::params::homedir}/repos/${project}":
            ensure  => directory,
            require => File["${reprepro::params::homedir}/repos"],
        }
    }

    file { "${reprepro::params::homedir}/repos/${project}/${name}":
        ensure  => directory,
        require => File["${reprepro::params::homedir}/repos/${project}"],
    }

    file { "${reprepro::params::homedir}/repos/${project}/${name}/${ostype}":
        ensure  => directory,
        require => File["$reprepro::params::homedir/repos/${project}/${name}"],
        recurse => true,
    }

    file { [
        "${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/bin",
        "${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/db",
        "${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/dists",
        "${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/conf",
        "${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/incoming",
        "${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/logs",
        "${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/tmp"
    ]:
        ensure  => directory,
        require => File["${reprepro::params::homedir}/repos/${project}/${name}/${ostype}"],
    }

    file { "${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/bin/build_sources":
        content => template('reprepro/server/var/lib/reprepro/bin/build_sources.erb'),
        mode    => '0755',
        require => File["${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/bin"],
    }

    file { "${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/conf/distributions":
        content => template('reprepro/server/var/lib/reprepro/conf/distributions.erb'),
        require => File["${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/conf"],
    }

    file { "${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/conf/incoming":
        content => template('reprepro/server/var/lib/reprepro/conf/incoming.erb'),
        require => File["${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/conf"],
    }

    /* XXX APT module? */
    file { "/etc/apt/sources.list.d/reprepro-${project}-${name}-${ostype}.list":
        content => template('reprepro/server/etc/apt/sources.list.d/reprepro.list.erb'),
        group   => root,
        owner   => root,
    }

    exec { "reprepro ${project}/${name}/${ostype} clearvanished":
        command     => "/usr/bin/reprepro -V -b ${reprepro::params::homedir}/repos/${project}/${name}/${ostype} clearvanished",
        group       => $reprepro::params::user,
        refreshonly => true,
        require     => File["${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/db"],
        subscribe   => File["${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/conf/distributions"],
        user        => $reprepro::params::user,
    }

    exec { "reprepro ${project}/${name}/${ostype} export":
        command     => "/usr/bin/reprepro -V -b ${reprepro::params::homedir}/repos/${project}/${name}/${ostype} export",
        group       => $reprepro::params::user,
        refreshonly => true,
        require     => File["${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/dists"],
        subscribe   => Exec["reprepro ${project}/${name}/${ostype} clearvanished"],
        user        => $reprepro::params::user,
    }

    cron { "reprepro ${project}/${name}/${ostype} processincoming":
        command => "/usr/bin/reprepro -V --keepunreferencedfiles -b ${reprepro::params::homedir}/repos/${project}/${name}/${ostype} processincoming incoming",
        minute  => '*/5',
        require => User[$reprepro::params::user],
        user    => $reprepro::params::user,
    }
}
