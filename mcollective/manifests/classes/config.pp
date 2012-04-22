class mcollective::classes::config {
	if defined(Class['mcollective::server']) {		
		file { "$mcollective::params::server_cfg":
			ensure	=> present,
			mode	=> 0640,
			content	=> template('mcollective/server.erb'),
			require	=> Class["mcollective::classes::install"],
			notify	=> Class["mcollective::classes::service"],
		}
	}

	if defined(Class['mcollective::client']) {		
		file { "$mcollective::params::client_cfg":
			ensure	=> present,
			mode	=> 0640,
			content	=> template('mcollective/client.erb'),
			require	=> Class["mcollective::classes::install"],
		}
	}
}
