class apt {
	include apt::params
	include apt::install
	include apt::config

	if $firewall == 'yes' {
		include ssh::firewall
	}
}
