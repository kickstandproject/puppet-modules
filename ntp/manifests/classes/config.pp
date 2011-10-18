class ntp::classes::config {
	file { 'ntp.conf':
		path	=> $ntp::params::configfile,
		mode	=> $ntp::params::configfile_mode,
		owner	=> $ntp::params::configfile_owner,
		group	=> $ntp::params::configfile_group,
		ensure	=> present,
		source	=> "puppet:///modules/ntp/ntp.conf",
		require => Class['ntp::classes::install'],
		notify	=> Class['ntp::classes::service'],
	}
}
