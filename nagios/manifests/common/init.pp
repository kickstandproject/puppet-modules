class nagios::common::init {
        include nagios::params
        include nagios::common::install
        include nagios::common::config
        include nagios::common::service
}
