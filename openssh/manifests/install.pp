class openssh::install {
	package { 'openssh':
		name	=> $openssh::params::packagename,
		ensure	=> present,
	}
}
