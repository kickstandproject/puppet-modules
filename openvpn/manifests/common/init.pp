class openvpn::common::init {
    include openvpn::params
    include openvpn::common::install
    include openvpn::common::config
    include openvpn::common::service
}
