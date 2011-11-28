class nagios::nsca::common::init {
        include nagios::nsca::params
        include nagios::nsca::common::install
        include nagios::nsca::common::config
        include nagios::nsca::common::service
}
