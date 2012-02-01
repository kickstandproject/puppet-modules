class openvpn::server inherits openvpn::common::init {
    if ($firewall == 'yes') {
        include openvpn::common::firewall
    }
}
