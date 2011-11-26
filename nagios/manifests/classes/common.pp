class nagios::classes::common {
        include nagios::params
        include nagios::classes::install
        include nagios::classes::config
        include nagios::classes::service
}
