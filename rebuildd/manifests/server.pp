class rebuildd::server inherits rebuildd::common::init {
	if ($firewall == 'yes') {
		include rebuildd::common::firewall
	}
}
