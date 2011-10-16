class ssh {
	include ssh::params, ssh::install, ssh::config, ssh::service

	if $firewall == 'yes' {
		include ssh::firewall
	}
}
