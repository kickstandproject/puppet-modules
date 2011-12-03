class puppet::common::install {
	require puppet::params

	if defined(Class['puppet::client']) {
		$packagename = $puppet::params::packagename_client
	} else {
		$packagename = $puppet::params::packagename
	}

	package { "$packagename":
		ensure	=> present,
	}
}
