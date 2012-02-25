class puppet::mysql::init {
    require puppet::params

    if ($puppet::params::db_server == 'localhost') {
        require mysql::server
    }

}
