class nagios::nsca::server inherits nagios::nsca::common::init {

	Nagios_host	<<| tag == "$fqdn" |>>
}
