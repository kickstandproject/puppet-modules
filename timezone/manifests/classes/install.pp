class timezone::classes::install {
	package { 'timezone':
		name	=> $timezone::params::packagename,
		ensure	=> present,
	}
}
