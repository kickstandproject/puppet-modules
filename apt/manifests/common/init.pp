class apt::common::init {
    include apt::params
    include apt::common::install
    include apt::common::config
}
