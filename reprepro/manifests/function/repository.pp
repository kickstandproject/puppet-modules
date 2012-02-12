define reprepro::function::repository(
    $buildoptions = '',
    $ostype = 'ubuntu',
    $gpgkey = '',
    $project = 'default',
    $rsynchostname = '',
    $rsyncuser = ''
) {
    require reprepro::server
    require pbuilder::client

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
        "${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/bin/hook.d",
        "${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/conf",
        "${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/db",
        "${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/dists",
        "${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/incoming",
        "${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/keys",
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

    file { "${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/bin/hook.d/D10repository":
        ensure  => present,
        content => template('pbuilder/client/hook.d/D10repository.erb'),
        mode    => '0755',
    }

    file { "${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/bin/hook.d/D10reprepro-repository":
        ensure  => present,
        content => template('reprepro/server/var/lib/reprepro/bin/hook.d/D10reprepro-repository.erb'),
        mode    => '0755',
    }

    file { "${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/bin/hook.d/D20aptupdate":
        ensure  => present,
        content => template('pbuilder/client/hook.d/D20aptupdate.erb'),
        mode    => '0755',
    }

    file { "${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/bin/rebuildd-build-cmd":
        content => template('reprepro/server/var/lib/reprepro/bin/rebuildd-build-cmd.erb'),
        mode    => '0755',
        require => File["${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/bin"],
    }

    file { "${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/bin/rebuildd-post-build-cmd":
        content => template('reprepro/server/var/lib/reprepro/bin/rebuildd-post-build-cmd.erb'),
        mode    => '0755',
        require => File["${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/bin"],
    }

    file { "${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/bin/rebuildd-source-cmd":
        content => template('reprepro/server/var/lib/reprepro/bin/rebuildd-source-cmd.erb'),
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

    file { "${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/conf/options":
        content => template('reprepro/server/var/lib/reprepro/conf/options.erb'),
        require => File["${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/conf"],
    }

    apt::function::repository { "reprepro-${project}-${name}-${ostype}":
        protocol    => 'file:',
        url         => "${reprepro::params::homedir}/repos/${project}/${name}/${ostype}",
        components  => main,
    }

    exec { "reprepro ${project}/${name}/${ostype} clearvanished":
        command     => "/usr/bin/reprepro -b ${reprepro::params::homedir}/repos/${project}/${name}/${ostype} clearvanished",
        group       => $reprepro::params::user,
        refreshonly => true,
        require     => File["${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/db"],
        subscribe   => File["${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/conf/distributions"],
        user        => $reprepro::params::user,
    }

    exec { "reprepro ${project}/${name}/${ostype} export":
        command     => "/usr/bin/reprepro -b ${reprepro::params::homedir}/repos/${project}/${name}/${ostype} export",
        group       => $reprepro::params::user,
        refreshonly => true,
        require     => File["${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/dists"],
        subscribe   => Exec["reprepro ${project}/${name}/${ostype} clearvanished"],
        user        => $reprepro::params::user,
    }

    /* XXX TODO Create cron module */
    /* XXX TODO This needs to be purged! */
    cron { "reprepro ${project}/${name}/${ostype} processincoming":
        command => "/usr/bin/reprepro -b ${reprepro::params::homedir}/repos/${project}/${name}/${ostype} processincoming incoming",
        minute  => '*/5',
        require => User[$reprepro::params::user],
        user    => $reprepro::params::user,
    }

    if ($rsynchostname != '') {
        file { "${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/bin/rsync":
            content => template('reprepro/server/var/lib/reprepro/bin/rsync.erb'),
            mode    => '0755',
            require => File["${reprepro::params::homedir}/repos/${project}/${name}/${ostype}/bin"],
        }
    }
}
