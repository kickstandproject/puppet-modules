class pbuilder::common::config {
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

	file { "$pbuilder::params::localbindir/__pbuilder.sh":
		content	=> template('pbuilder/client/__pbuilder.sh.erb'),
		ensure	=> present,
		mode	=> 755,
	}

	file { "$pbuilder::params::cachedir":
		ensure	=> directory,
		require	=> File["$pbuilder::params::configfile"],
	}

	file { "$pbuilder::params::cachedir/ccache":
		ensure	=> directory,
		require => File["$pbuilder::params::cachedir"],
	}

	file { "$pbuilder::params::cachedir/lucid-amd64-base.tgz":
		ensure	=> present,
		notify	=> Exec['pbuilder-create-amd64'],
		require => File["$pbuilder::params::cachedir"],
	}

	file { "$pbuilder::params::cachedir/lucid-i386-base.tgz":
		ensure	=> present,
		notify	=> Exec['pbuilder-create-i386'],
		require => File["$pbuilder::params::cachedir"],
	}

	exec { 'pbuilder-create-amd64':
		command		=> "$pbuilder::params::localbindir/__pbuilder.sh create lucid amd64",
		refreshonly	=> true,
		require		=> File["$pbuilder::params::localbindir/__pbuilder.sh"],
		timeout		=> 1800,
	}

	exec { 'pbuilder-create-i386':
		command		=> "$pbuilder::params::localbindir/__pbuilder.sh create lucid i386",
		refreshonly	=> true,
		require		=> File["$pbuilder::params::localbindir/__pbuilder.sh"],
		timeout		=> 1800,
	}
}
