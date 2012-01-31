class squid::common::init {
    include squid::params
    include squid::common::install
    include squid::common::config
    include squid::common::service
}
