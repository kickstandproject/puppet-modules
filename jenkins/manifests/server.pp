class jenkins::server inherits jenkins::common::init {
    include jenkins::common::apache

    if ($firewall == 'yes') {
        include jenkins::common::firewall
    }
}
