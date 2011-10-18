class git::classes::install {
	package { 'git-core':
		name	=> $git::params::packagename,
		ensure	=> present,
	}
}
