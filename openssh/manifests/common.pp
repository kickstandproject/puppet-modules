class openssh:common {
	if $firewall == 'yes' {
		include openssh::firewall
	}
}
