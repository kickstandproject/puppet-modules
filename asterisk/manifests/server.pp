class asterisk::server {
	include asterisk::params
	include asterisk::classes::install
	include asterisk::classes::service

	if $firewall == 'yes' {
		include asterisk::classes::firewall
	}
}
