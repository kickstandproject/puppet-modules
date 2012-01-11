class rebuildd::server inherits rebuildd::common::init {
	require apache::server
	require pbuilder::client

	if ($firewall == 'yes') {
		include rebuildd::common::firewall
	}
}
