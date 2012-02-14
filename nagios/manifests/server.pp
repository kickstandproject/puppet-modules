class nagios::server inherits nagios::common::init {
    include nagios::nsca::server

    if ($nagios_web == 'yes') {
        include nagios::apache::init
    }

    if ($firewall == 'yes') {
        include nagios::common::firewall
    }
}
