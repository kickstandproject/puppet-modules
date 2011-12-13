class rebuildd::server inherits rebuildd::common::init {
	require pbuilder::client

	if ($firewall == 'yes') {
		include rebuildd::common::firewall
	}
}
