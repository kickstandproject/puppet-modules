class nagios::client inherits nagios::common::init {
    include snmp::server
    include nagios::nsca::client
}
