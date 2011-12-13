class mcollective::classes::install {

	package { 'rubygems':
		ensure => installed,
		require => Class["mcollective::classes::apt"],
	}

	package { 'libstomp-ruby':
		ensure	=> installed,
		require	=> Class["mcollective::classes::apt"],
	}

	package { 'mcollective-common':
		ensure => installed,
		require => Package["rubygems"],
	}

	if defined(Class['mcollective::server']) { 
		package { 'mcollective':
			ensure => installed,
			require => Package["mcollective-common"],
		}
	}

	if defined(Class['mcollective::client']) {
		package { 'mcollective-client':
			ensure => installed,
			require => Package["mcollective-common"],
		}
	}
}
