class rebuildd::common::init {
    include rebuildd::params
    include rebuildd::common::install
    include rebuildd::common::config
    include rebuildd::common::service

    if ($monitor == 'yes') {
        include rebuildd::common::monitor
    }
}
