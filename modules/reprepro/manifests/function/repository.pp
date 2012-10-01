#
# puppet-modules: The Kickstand Project
#
# Copyright (C) 2011, Polybeacon, Inc.
#
# Paul Belanger <paul.belanger@polybeacon.com>
#
# See http://kickstand-project.org for more information about
# the Kickstand project. Please do not directly contact any
# of the maintainers of this project for assistance; the
# project provides a web site, forums and IRC channels for
# your use.
#
# This program is free software, distributed under the terms
# of the GNU General Public License Version 2. See the LICENSE
# file at the top of the source tree.
#
define reprepro::function::repository(
    $repo,
    $buildoptions = '',
    $ostype = 'ubuntu',
    $gpgkey = '',
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

    if (!defined(File["${reprepro::params::basedir}/repos/${name}"])) {
        file { "${reprepro::params::basedir}/repos/${name}":
            ensure  => directory,
            require => File["${reprepro::params::basedir}/repos"],
        }
    }

    file { "${reprepro::params::basedir}/repos/${name}/${repo}":
        ensure  => directory,
        require => File["${reprepro::params::basedir}/repos/${name}"],
    }

    file { "${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}":
        ensure  => directory,
        require => File["$reprepro::params::basedir/repos/${name}/${repo}"],
        recurse => true,
    }

    file { [
        "${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/bin",
        "${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/bin/hook.d",
        "${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/conf",
        "${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/db",
        "${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/dists",
        "${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/incoming",
        "${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/keys",
        "${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/logs",
        "${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/tmp"
    ]:
        ensure  => directory,
        require => File["${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}"],
    }

    file { "${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/bin/build_sources":
        content => template('reprepro/var/lib/reprepro/bin/build_sources.erb'),
        mode    => '0755',
        require => File["${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/bin"],
    }

    file { "${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/bin/hook.d/D10repository":
        ensure  => present,
        content => template('pbuilder/hook.d/D10repository.erb'),
        mode    => '0755',
    }

    file { "${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/bin/hook.d/D10reprepro-repository":
        ensure  => present,
        content => template('reprepro/var/lib/reprepro/bin/hook.d/D10reprepro-repository.erb'),
        mode    => '0755',
    }

    file { "${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/bin/hook.d/D20aptupdate":
        ensure  => present,
        content => template('pbuilder/hook.d/D20aptupdate.erb'),
        mode    => '0755',
    }

    file { "${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/bin/rebuildd-build-cmd":
        content => template('reprepro/var/lib/reprepro/bin/rebuildd-build-cmd.erb'),
        mode    => '0755',
        require => File["${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/bin"],
    }

    file { "${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/bin/rebuildd-post-build-cmd":
        content => template('reprepro/var/lib/reprepro/bin/rebuildd-post-build-cmd.erb'),
        mode    => '0755',
        require => File["${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/bin"],
    }

    file { "${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/bin/rebuildd-source-cmd":
        content => template('reprepro/var/lib/reprepro/bin/rebuildd-source-cmd.erb'),
        mode    => '0755',
        require => File["${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/bin"],
    }

    file { "${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/conf/distributions":
        content => template('reprepro/var/lib/reprepro/conf/distributions.erb'),
        require => File["${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/conf"],
    }

    file { "${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/conf/incoming":
        content => template('reprepro/var/lib/reprepro/conf/incoming.erb'),
        require => File["${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/conf"],
    }

    file { "${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/conf/options":
        content => template('reprepro/var/lib/reprepro/conf/options.erb'),
        require => File["${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/conf"],
    }

    exec { "reprepro ${name}/${repo}/${ostype} clearvanished":
        command     => "/usr/bin/reprepro -b ${reprepro::params::basedir}/repos/${name}/${repo}/${ostype} clearvanished",
        group       => $reprepro::params::user,
        refreshonly => true,
        require     => File["${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/db"],
        subscribe   => File[[
            "${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/conf/distributions",
            "${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/conf/incoming",
            "${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/conf/options"
        ]],
        user        => $reprepro::params::user,
    }

    exec { "reprepro ${name}/${repo}/${ostype} export":
        command     => "/usr/bin/reprepro -b ${reprepro::params::basedir}/repos/${name}/${repo}/${ostype} export",
        group       => $reprepro::params::user,
        refreshonly => true,
        require     => File["${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/dists"],
        subscribe   => Exec["reprepro ${name}/${repo}/${ostype} clearvanished"],
        user        => $reprepro::params::user,
    }

    /* XXX TODO Create cron module */
    /* XXX TODO This needs to be purged! */
    cron { "reprepro ${name}/${repo}/${ostype} processincoming":
        command => "/usr/bin/reprepro -b ${reprepro::params::basedir}/repos/${name}/${repo}/${ostype} processincoming incoming",
        minute  => '*/5',
        require => User[$reprepro::params::user],
        user    => $reprepro::params::user,
    }

    if ($rsynchostname != '') {
        file { "${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/bin/rsync":
            content => template('reprepro/var/lib/reprepro/bin/rsync.erb'),
            mode    => '0755',
            require => File["${reprepro::params::basedir}/repos/${name}/${repo}/${ostype}/bin"],
        }
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
