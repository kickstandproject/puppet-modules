class apt::config {
	exec { aptget_update:
		command 	=> $apt::params::aptget,
		refreshonly	=> true,
	}

	file { 'sources.list':
		name	=> $apt::params::configfile,
		mode	=> $apt::params::configfile_mode,
		owner	=> $apt::params::configfile_owner,
		group	=> $apt::params::configfile_group,
		ensure	=> present,
		source	=> "puppet:///modules/apt/sources.list",
		notify	=> Exec["aptget_update"],
	}


}
