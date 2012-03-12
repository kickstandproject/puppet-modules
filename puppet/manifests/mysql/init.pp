class puppet::mysql::init {
    include puppet::params
    require ruby-activerecord::client
    require ruby-mysql::client

    if ($puppet::params::db_server == 'localhost') {
        require mysql::server
    }
}
