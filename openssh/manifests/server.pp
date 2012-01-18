class openssh::server inherits openssh::common::init {
    if ($firewall == 'yes') {
        include openssh::common::firewall
    }
}
