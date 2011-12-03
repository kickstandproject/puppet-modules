class openssh::server {
	if ($firewall == 'yes') {
		include openssh::common::firewall
	}
}
