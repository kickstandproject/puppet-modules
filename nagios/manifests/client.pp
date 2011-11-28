class nagios::client inherits nagios::common::init {
	include nagios::nsca::client
}
