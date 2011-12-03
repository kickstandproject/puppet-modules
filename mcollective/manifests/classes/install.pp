class mcollective::classes::install {

	file { mcollective-common:
		name => "$mcollective::params::mcollective_common_file",
		source => "puppet:///modules/mcollective/$mcollective::params::mcollective_common_file",
		ensure => present,
		path => "/tmp/$mcollective::params::mcollective_common_file",
	}

	package { 'rubygems':
		ensure => installed,
		require => Class["ppa::sources"],
	}

	package { 'libstomp-ruby':
		ensure	=> installed,
		require	=> Class["ppa::sources"],
	}

	package { 'mcollective-common':
		ensure => installed,
		require => Package["rubygems"],
		source => "/tmp/$mcollective::params::mcollective_common_file",
		provider => "$mcollective::params::provider",
	}

	if defined(Class['mcollective::server']) { 
		file { mcollective:
			name => "$mcollective::params::mcollective_file",
			source => "puppet:///modules/mcollective/$mcollective::params::mcollective_file",
			ensure => present,
			path => "/tmp/$mcollective::params::mcollective_file",
		}

		package { 'mcollective':
			ensure => installed,
			require => Package["mcollective-common"],
			source => "/tmp/$mcollective::params::mcollective_file",
			provider => "$mcollective::params::provider",
		}
	}

	if defined(Class['mcollective::client']) {
		file { mcollective-client:
			name => "$mcollective::params::mcollective_client_file",
			source => "puppet:///modules/mcollective/$mcollective::params::mcollective_client_file",
			ensure => present,
			path => "/tmp/$mcollective::params::mcollective_client_file",
		}

		package { 'mcollective-client':
			ensure => installed,
			require => Package["mcollective-common"],
			source => "/tmp/$mcollective::params::mcollective_client_file",
			provider => "$mcollective::params::provider",
		}
	}
}
