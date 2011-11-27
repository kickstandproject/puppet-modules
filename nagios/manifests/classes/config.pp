class nagios::classes::config {
	file { 'nagios.cfg':
		name	=> $nagios::params::configfile,
		mode	=> $nagios::params::configfile_mode,
		owner	=> $nagios::params::configfile_owner,
		group	=> $nagios::params::configfile_group,
		ensure	=> present,
		content	=> template('nagios/client/nagios.cfg.erb'),
		require => Class['nagios::classes::install'],
		notify	=> Class['nagios::classes::service'],
	}

	file { 'nagios_configdir':
		name	=> $nagios::params::customconfigdir,
		mode	=> $nagios::params::configfile_mode,
		owner	=> $nagios::params::configfile_owner,
		group	=> $nagios::params::configfile_group,
		ensure	=> directory,
		require => Class['nagios::classes::install'],
		recurse	=> true,
		purge	=> true,
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
		purge	=> true,
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
		purge	=> true,
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
		purge	=> true,
		force	=> true,
	}

	file { 'generic-service.cfg':
		name	=> "$nagios::params::customconfigdir/services/generic-service.cfg",
		mode	=> 644,
		owner	=> $nagios::params::configfile_owner,
		group	=> $nagios::params::configfile_group,
		ensure	=> present,
		content	=> template('nagios/client/services/generic-service.cfg.erb'),
		require => File['nagios_configdir_services'],
	}

	file { 'generic-host.cfg':
		name	=> "$nagios::params::customconfigdir/hosts/generic-host.cfg",
		mode	=> 644,
		owner	=> $nagios::params::configfile_owner,
		group	=> $nagios::params::configfile_group,
		ensure	=> present,
		content	=> template('nagios/client/hosts/generic-host.cfg.erb'),
		require => File['nagios_configdir_hosts'],
	}

	file { 'timeperiods.cfg':
		name	=> "$nagios::params::customconfigdir/timeperiods.cfg",
		mode	=> 644,
		owner	=> $nagios::params::configfile_owner,
		group	=> $nagios::params::configfile_group,
		ensure	=> present,
		content	=> template('nagios/client/timeperiods.cfg.erb'),
		require => File['nagios_configdir'],
	}

	file { 'contacts.cfg':
		name	=> "$nagios::params::customconfigdir/contacts.cfg",
		mode	=> 644,
		owner	=> $nagios::params::configfile_owner,
		group	=> $nagios::params::configfile_group,
		ensure	=> present,
		content	=> template('nagios/client/contacts.cfg.erb'),
		require => File['nagios_configdir'],
	}

	file { 'commands-general.cfg':
		name	=> "$nagios::params::customconfigdir/commands/general.cfg",
		mode	=> 644,
		owner	=> $nagios::params::configfile_owner,
		group	=> $nagios::params::configfile_group,
		ensure	=> present,
		content	=> template('nagios/client/commands/general.cfg.erb'),
		require => File['nagios_configdir_commands'],
	}

	file { 'nagios-hosts-localhost.cfg':
		name	=> "$nagios::params::customconfigdir/hosts/localhost.cfg",
		mode	=> 644,
		owner	=> $nagios::params::configfile_owner,
		group	=> $nagios::params::configfile_group,
		ensure	=> present,
		content	=> template('nagios/client/hosts/localhost.cfg.erb'),
		require => File['nagios_configdir_hosts'],
	}

	file { 'nagios-services-general.cfg':
		name	=> "$nagios::params::customconfigdir/services/general.cfg",
		mode	=> 644,
		owner	=> $nagios::params::configfile_owner,
		group	=> $nagios::params::configfile_group,
		ensure	=> present,
		content	=> template('nagios/client/services/general.cfg.erb'),
		require => File['nagios_configdir_services'],
	}
}
