class squid::server inherits squid::common::init {
    if ($firewall == 'yes') {
        include squid::common::firewall
    }
}
