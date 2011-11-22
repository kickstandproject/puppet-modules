class asterisk::classes::install {
	package { 'asterisk':
		name	=> $asterisk::params::packagename,
		ensure	=> present,
	}
}
