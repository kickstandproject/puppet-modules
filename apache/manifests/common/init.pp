class apache::common::init {
    include apache::params
    include apache::common::install
    include apache::common::config
    include apache::common::service
}
