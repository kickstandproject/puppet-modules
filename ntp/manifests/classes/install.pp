class ntp::classes::install {
	package { 'ntp':
		name	=> $ntp::params::packagename,
		ensure => present,
	}
}
