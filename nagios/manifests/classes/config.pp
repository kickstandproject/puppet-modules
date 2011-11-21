class nagios::classes::config {
	file { 'nagios.cfg':
		name	=> $nagios::params::configfile,
		mode	=> $nagios::params::configfile_mode,
		owner	=> $nagios::params::configfile_owner,
		group	=> $nagios::params::configfile_group,
		ensure	=> present,
		content	=> template('nagios/nagios.cfg.erb'),
		require => Class['nagios::classes::install'],
		notify	=> Class['nagios::classes::service'],
	}
}
