class apache::common::config {
	File {
		group	=> $apache::params::configfile_group,
		mode	=> $apache::params::configfile_mode,
		owner	=> $apache::params::configfile_owner,
		require => Class['apache::common::install'],
        }

	file { "$apache::params::defaultfile":
		content => template('apache/server/etc/default/apache2.erb'),
		ensure	=> present,
	}

	file { "$apache::params::rootdir":
		ensure	=> directory,
	}
}
