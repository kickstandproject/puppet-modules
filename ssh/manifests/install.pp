class ssh::install {
	package { 'openssh':
		name	=> $ssh::params::packagename,
		ensure	=> present,
	}
}
