class nagios::nsca::common::config {
	file { 'nagios_nsca.cfg':
		name	=> $nagios::nsca::params::configfile,
		mode	=> $nagios::nsca::params::configfile_mode,
		owner	=> $nagios::nsca::params::configfile_owner,
		group	=> $nagios::nsca::params::configfile_group,
		ensure	=> present,
		content	=> template('nagios/nsca/nsca.cfg.erb'),
		require => Class['nagios::nsca::common::install'],
		notify	=> Class['nagios::nsca::common::service'],
	}

	if defined(Class['nagios::nsca::client']) {
		file { 'nagios_nsca_send_nsca.cfg':
			name	=> $nagios::nsca::params::configfile_client,
			mode	=> $nagios::nsca::params::configfile_mode,
			owner	=> $nagios::nsca::params::configfile_owner,
			group	=> $nagios::nsca::params::configfile_group,
			ensure	=> present,
			content	=> template('nagios/nsca/client/send_nsca.cfg.erb'),
			require => Class['nagios::nsca::common::install'],
		}
	}
}
