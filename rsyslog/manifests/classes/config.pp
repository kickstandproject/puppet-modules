class rsyslog::classes::config {
	file { 'rsyslog.conf':
		name	=> $rsyslog::params::configfile,
		mode	=> $rsyslog::params::configfile_mode,
		owner	=> $rsyslog::params::configfile_owner,
		group	=> $rsyslog::params::configfile_group,
		ensure	=> present,
		require => Class['rsyslog::classes::install'],
		notify	=> Class['rsyslog::classes::service'],
	}

	if defined(Class['rsyslog::client']) {
		file['rsyslog.conf'] {
			content	=> template("rsyslog/client/rsyslog.conf.erb"),
		}
	} else {
		file['rsyslog.conf'] {
			content	=> template("rsyslog/server/rsyslog.conf.erb"),
		}
	}
}
