class nagios::nsca::server inherits nagios::nsca::common::init {
	File		<<| tag == "$fqdn" |>>
	Nagios_command	<<| tag == "$fqdn" |>>
	Nagios_host	<<| tag == "$fqdn" |>>
	Nagios_service	<<| tag == "$fqdn" |>>
}
