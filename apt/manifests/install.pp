class apt::install {
	package { 'apt':
		name	=> $apt::params::packagename,
		ensure	=> present,
	}
}
