class jenkins::common::init {
    include jenkins::params
    include jenkins::common::install
    include jenkins::common::config
    include jenkins::common::service
}
