class jenkins::server inherits jenkins::common::init {
    if ($firewall == 'yes') {
        include jenkins::common::firewall
    }
}
