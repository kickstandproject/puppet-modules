class pbuilder::common::config {
	require $pbuilder::params

	File {
		group	=> $pbuilder::params::configfile_group,
		mode	=> $pbuilder::params::configfile_mode,
		owner	=> $pbuilder::params::configfile_owner,
		require => Class['pbuilder::common::install'],
	}

	file { "$pbuilder::params::configfile":
		content	=> template('pbuilder/client/pbuilderrc.erb'),
		ensure	=> present,
	}

	/* XXX crontab module? */
	file { '/etc/crontab.daily':
		content	=> template('pbuilder/client/cron.daily/pbuilder.erb'),
		ensure	=> directory,
		group	=> root,
		mode	=> 644,
		owner	=> root,
	}

	file { "$pbuilder::params::cachedir":
		ensure	=> directory,
		require	=> File["$pbuilder::params::configfile"],
	}

	file { "$pbuilder::params::cachedir/ccache":
		ensure	=> directory,
		require => File["$pbuilder::params::cachedir"],
	}

	file { "$pbuilder::params::cachedir/hook.d":
		ensure	=> directory,
		require => File["$pbuilder::params::cachedir"],
	}

	file { "$pbuilder::params::cachedir/hook.d/D10aptupdate":
		content	=> template('pbuilder/client/hook.d/D10aptupdate.erb'),
		ensure	=> present,
		mode	=> 755,
		require => File["$pbuilder::params::cachedir/hook.d"],
	}

	file { "$pbuilder::params::cachedir/hook.d/D20repository":
		content	=> template('pbuilder/client/hook.d/D20repository.erb'),
		ensure	=> present,
		mode	=> 755,
		require => File["$pbuilder::params::cachedir/hook.d"],
	}

	define pbuilder-distribution() {
		file { "$pbuilder::params::localbindir/pbuilder-$name-amd64":
			content	=> template('pbuilder/client/pbuilder-distribution.sh.erb'),
			ensure	=> present,
			mode	=> 755,
		}

		file { "$pbuilder::params::localbindir/pbuilder-$name-i386":
			content	=> template('pbuilder/client/pbuilder-distribution.sh.erb'),
			ensure	=> present,
			mode	=> 755,
		}

		exec { "pbuilder-create-$name-amd64":
			command	=> "$pbuilder::params::localbindir/pbuilder-$name-amd64 create",
			creates	=> "$pbuilder::params::cachedir/$name-amd64-base.tgz",
			require	=> File["$pbuilder::params::localbindir/pbuilder-$name-amd64"],
			timeout	=> 1800,
		}

		exec { "pbuilder-create-$name-i386":
			command	=> "$pbuilder::params::localbindir/pbuilder-$name-i386 create",
			creates	=> "$pbuilder::params::cachedir/$name-i386-base.tgz",
			require	=> File["$pbuilder::params::localbindir/pbuilder-$name-i386"],
			timeout	=> 1800,
		}
	}
	$releases = split($pbuilder::params::releases, ' ')
	pbuilder-distribution { $releases:
	}
}
