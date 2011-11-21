class nagios::classes::config {
	file { 'nagios.cfg':
		name	=> $nagios::params::configfile,
		mode	=> $nagios::params::configfile_mode,
		owner	=> $nagios::params::configfile_owner,
		group	=> $nagios::params::configfile_group,
		ensure	=> present,
#		source	=> 'puppet:///modules/openssh/sshd_config',
		require => Class['nagios::classes::install'],
		notify	=> Class['nagios::classes::service'],
	}
}
