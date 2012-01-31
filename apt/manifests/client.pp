class apt::client inherits apt::common::init {
    if ($squid_server) {
        include apt::common::squid
    }
}
