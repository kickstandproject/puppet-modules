class openssh::server {
	include openssh::params
	include openssh::classes::install
	include openssh::classes::config
	include openssh::classes::service

	if $firewall == 'yes' {
		include openssh::classes::firewall
	}
}
