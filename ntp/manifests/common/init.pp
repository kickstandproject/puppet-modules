class ntp::common::init {
    include ntp::params
    include ntp::common::install
    include ntp::common::config
    include ntp::common::service
}
