class nagios::apache::init {
    require apache::server
    include nagios::params
    include nagios::apache::install
    include nagios::apache::config
}
