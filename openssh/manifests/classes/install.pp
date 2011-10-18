class openssh::classes::install {
	package { 'openssh':
		name	=> $openssh::params::packagename,
		ensure	=> present,
	}
}
