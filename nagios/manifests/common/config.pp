class nagios::common::config {
	file { 'nagios.cfg':
		name	=> $nagios::params::configfile,
		mode	=> $nagios::params::configfile_mode,
		owner	=> $nagios::params::configfile_owner,
		group	=> $nagios::params::configfile_group,
		ensure	=> present,
		content	=> template('nagios/client/nagios.cfg.erb'),
		require => Class['nagios::common::install'],
		notify	=> Class['nagios::common::service'],
	}

	file { 'nagios_configdir':
		name	=> $nagios::params::customconfigdir,
		mode	=> $nagios::params::configfile_mode,
		owner	=> $nagios::params::configfile_owner,
		group	=> $nagios::params::configfile_group,
		ensure	=> directory,
		require => Class['nagios::common::install'],
		recurse	=> true,
		force	=> true,
	}

	file { 'nagios_configdir_services':
		name	=> "$nagios::params::customconfigdir/services",
		mode	=> $nagios::params::configfile_mode,
		owner	=> $nagios::params::configfile_owner,
		group	=> $nagios::params::configfile_group,
		ensure	=> directory,
		require => File['nagios_configdir'],
		recurse	=> true,
		force	=> true,
	}

	file { 'nagios_configdir_hosts':
		name	=> "$nagios::params::customconfigdir/hosts",
		mode	=> $nagios::params::configfile_mode,
		owner	=> $nagios::params::configfile_owner,
		group	=> $nagios::params::configfile_group,
		ensure	=> directory,
		require => File['nagios_configdir'],
		recurse	=> true,
		force	=> true,
	}

	file { 'nagios_configdir_commands':
		name	=> "$nagios::params::customconfigdir/commands",
		mode	=> $nagios::params::configfile_mode,
		owner	=> $nagios::params::configfile_owner,
		group	=> $nagios::params::configfile_group,
		ensure	=> directory,
		require => File['nagios_configdir'],
		recurse	=> true,
		force	=> true,
	}

	file { 'nagios_configdir_services_generic.cfg':
		name	=> "$nagios::params::customconfigdir/services/generic.cfg",
		mode	=> 644,
		owner	=> $nagios::params::configfile_owner,
		group	=> $nagios::params::configfile_group,
		ensure	=> present,
		content	=> template('nagios/client/services/generic.cfg.erb'),
		require => File['nagios_configdir_services'],
	}

	file { 'nagios_configdir_hosts_generic.cfg':
		name	=> "$nagios::params::customconfigdir/hosts/generic.cfg",
		mode	=> 644,
		owner	=> $nagios::params::configfile_owner,
		group	=> $nagios::params::configfile_group,
		ensure	=> present,
		content	=> template('nagios/client/hosts/generic.cfg.erb'),
		require => File['nagios_configdir_hosts'],
	}

	file { 'nagios_configdir_timeperiods.cfg':
		name	=> "$nagios::params::customconfigdir/timeperiods.cfg",
		mode	=> 644,
		owner	=> $nagios::params::configfile_owner,
		group	=> $nagios::params::configfile_group,
		ensure	=> present,
		content	=> template('nagios/client/timeperiods.cfg.erb'),
		require => File['nagios_configdir'],
	}

	file { 'nagios_configdir_contacts.cfg':
		name	=> "$nagios::params::customconfigdir/contacts.cfg",
		mode	=> 644,
		owner	=> $nagios::params::configfile_owner,
		group	=> $nagios::params::configfile_group,
		ensure	=> present,
		content	=> template('nagios/client/contacts.cfg.erb'),
		require => File['nagios_configdir'],
	}

	file { 'nagios_configdir_commands_general.cfg':
		name	=> "$nagios::params::customconfigdir/commands/general.cfg",
		mode	=> 644,
		owner	=> $nagios::params::configfile_owner,
		group	=> $nagios::params::configfile_group,
		ensure	=> present,
		content	=> template('nagios/client/commands/general.cfg.erb'),
		require => File['nagios_configdir_commands'],
	}
}
