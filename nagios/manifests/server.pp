class nagios::server inherits nagios::common::init {
    include nagios::nsca::server

    if ($firewall == 'yes') {
        include nagios::common::firewall
    }
}
