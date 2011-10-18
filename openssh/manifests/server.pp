class openssh::server inherits openssh::classes::common {
	if $firewall == 'yes' {
		include openssh::classes::firewall
	}
}
