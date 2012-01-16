class reprepro::common::config {
	require reprepro::params

	File {
		ensure	=> present,
		group	=> "$reprepro::params::user",
		mode	=> 644,
		owner	=> "$reprepro::params::user",
	}

	user { "$reprepro::params::user":
		ensure		=> present,
		managehome	=> true,
	}

	file { "/home/$reprepro::params::user":
		ensure	=> directory,
		mode	=> 755,
		require	=> User["$reprepro::params::user"],
	}

	file { "/home/$reprepro::params::user/ubuntu":
		ensure	=> directory,
		mode	=> 644,
		recurse	=> true,
		require	=> File["/home/$reprepro::params::user"],
	}

	file { ["/home/$reprepro::params::user/ubuntu/bin",
		"/home/$reprepro::params::user/ubuntu/db",
		"/home/$reprepro::params::user/ubuntu/dists",
		"/home/$reprepro::params::user/ubuntu/conf",
		"/home/$reprepro::params::user/ubuntu/incoming",
		"/home/$reprepro::params::user/ubuntu/logs",
		"/home/$reprepro::params::user/ubuntu/tmp"]:
		ensure	=> directory,
		require	=> File["/home/$reprepro::params::user"],
	}

	file { "/home/$reprepro::params::user/ubuntu/bin/build_sources":
		content	=> template('reprepro/server/home/reprepro/ubuntu/bin/build_sources.erb'),
		mode	=> 755,
		require => File["/home/$reprepro::params::user/ubuntu/bin"],
	}

	file { "/home/$reprepro::params::user/ubuntu/conf/distributions":
		content	=> template('reprepro/server/home/reprepro/ubuntu/conf/distributions.erb'),
		require	=> File["/home/$reprepro::params::user/ubuntu/conf"],
	}

	file { "/home/$reprepro::params::user/ubuntu/conf/incoming":
		content	=> template('reprepro/server/home/reprepro/ubuntu/conf/incoming.erb'),
		require	=> File["/home/$reprepro::params::user/ubuntu/conf"],
	}

	/* XXX APT module? */
	file { '/etc/apt/sources.list.d/reprepro.list':
		content	=> template('reprepro/server/etc/apt/sources.list.d/reprepro.list.erb'),
		group	=> root,
		owner	=> root,
	}

	exec { 'reprepro clearvanished':
		command		=> "/usr/bin/reprepro -V -b /home/$reprepro::params::user/ubuntu clearvanished",
		group		=> $reprepro::params::user,
		refreshonly	=> true,
		require		=> File["/home/$reprepro::params::user/ubuntu/db"],
		subscribe	=> File["/home/$reprepro::params::user/ubuntu/conf/distributions"],
		user		=> $reprepro::params::user,
	}

	exec { 'reprepro export':
		command		=> "/usr/bin/reprepro -V -b /home/$reprepro::params::user/ubuntu export",
		group		=> $reprepro::params::user,
		refreshonly	=> true,
		require		=> File["/home/$reprepro::params::user/ubuntu/dists"],
		subscribe	=> Exec['reprepro clearvanished'],
		user		=> $reprepro::params::user,
	}

	cron { 'reprepro processincoming':
		command	=> "/usr/bin/reprepro -V --keepunreferencedfiles -b /home/$reprepro::params::user/ubuntu processincoming incoming",
		minute	=> '*/5',
		require	=> User["$reprepro::params::user"],
		user	=> $reprepro::params::user,
	}
}
