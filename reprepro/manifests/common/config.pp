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
		mode	=> 755,
		require	=> File["/home/$reprepro::params::user"],
	}

	file { ["/home/$reprepro::params::user/ubuntu/db",
		"/home/$reprepro::params::user/ubuntu/conf",
		"/home/$reprepro::params::user/ubuntu/incoming",
		"/home/$reprepro::params::user/ubuntu/logs",
		"/home/$reprepro::params::user/ubuntu/tmp"]:
		ensure	=> directory,
		mode	=> 755,
		require	=> File["/home/$reprepro::params::user"],
	}

	file { ["/home/$reprepro::params::user/ubuntu/db/checksums.db",
		"/home/$reprepro::params::user/ubuntu/db/contents.cache.db",
		"/home/$reprepro::params::user/ubuntu/db/packages.db",
		"/home/$reprepro::params::user/ubuntu/db/references.db",
		"/home/$reprepro::params::user/ubuntu/db/version"]:
		ensure	=> present,
		require => File["/home/$reprepro::params::user/ubuntu/db"],
		subscribe => Exec['reprepro clearvanished'],
	}

	file { "/home/$reprepro::params::user/ubuntu/conf/distributions":
		content	=> template('reprepro/server/home/reprepro/ubuntu/conf/distributions.erb'),
		require	=> File["/home/$reprepro::params::user/ubuntu/conf"],
	}

	file { "/home/$reprepro::params::user/ubuntu/conf/incoming":
		content	=> template('reprepro/server/home/reprepro/ubuntu/conf/incoming.erb'),
		require	=> File["/home/$reprepro::params::user/ubuntu/conf"],
	}

	exec { 'reprepro clearvanished':
		command		=> "/usr/bin/reprepro -V -b /home/$reprepro::params::user/ubuntu clearvanished",
		refreshonly	=> true,
		subscribe	=> File["/home/$reprepro::params::user/ubuntu/conf/distributions"],
	}

	cron { 'reprepro processincoming':
		command	=> "/usr/bin/reprepro -V --keepunreferencedfiles -b /home/$reprepro::params::user/ubuntu processincoming incoming",
		minute	=> '*/15',
		require	=> User["$reprepro::params::user"],
		user	=> $reprepro::params::user,
	}
}
