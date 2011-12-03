class puppet::common::config {
	require puppet::params

	if defined(Class['puppet::client']) {
		$content = 'client'
	} else {
		$content = 'server'
	}

	file { "$puppet::params::configfile":
		content	=> template("puppet/$content/puppet.conf.erb"),
		ensure	=> present,
		group	=> $puppet::params::configfile_group,
		mode	=> $puppet::params::configfile_mode,
		notify	=> Class['puppet::common::service'],
		owner	=> $puppet::params::configfile_owner,
		require => Class['puppet::common::install'],
	}

	file { "$puppet::params::defaultsfile":
		content	=> template("puppet/$content/puppet.erb"),
		ensure	=> present,
		group	=> $puppet::params::configfile_group,
		mode	=> $puppet::params::configfile_mode,
		notify	=> Class['puppet::common::service'],
		owner	=> $puppet::params::configfile_owner,
		require => Class['puppet::common::install'],
	}
}
