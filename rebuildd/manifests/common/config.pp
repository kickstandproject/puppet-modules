class rebuildd::common::config {
	require reprepro::server
	require pbuilder::client
	require rebuildd::params

	File {
		ensure	=> present,
		group	=> $rebuildd::params::configfile_group,
		mode	=> $rebuildd::params::configfile_mode,
		notify	=> Class['rebuildd::common::service'],
		owner	=> $rebuildd::params::configfile_owner,
		require => Class['rebuildd::common::install'],
	}

	file { "$rebuildd::params::configfile":
		content	=> template("rebuildd/server/rebuilddrc.erb"),
	}

	file { "$rebuildd::params::defaultsfile":
		content	=> template("rebuildd/server/rebuildd.erb"),
	}

	file { '/usr/local/bin/rebuildd-source-cmd':
		content	=> template('rebuildd/server/usr/local/bin/rebuildd-source-cmd.erb'),
		mode	=> 755,
	}

	file { '/usr/local/bin/rebuildd-post-build-cmd':
		content	=> template('rebuildd/server/usr/local/bin/rebuildd-post-build-cmd.erb'),
		mode	=> 755,
	}

	exec { 'rebuildd-create-database':
		command => '/usr/sbin/rebuildd init',
		creates => '/var/lib/rebuildd/rebuildd.db',
	}
}
