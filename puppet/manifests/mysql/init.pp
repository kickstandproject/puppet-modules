class puppet::mysql::init {
    include puppet::params
    require ruby-activerecord::client
    require ruby-mysql::client

    if ($puppet::params::db_server == 'localhost') {
        require mysql::server
    }

    mysql::functions::grant { $name:
        db_name     => $puppet::params::db_name,
        db_password => $puppet::params::db_password,
        db_server   => $puppet::params::db_server,
        db_user     => $puppet::params::db_user,
    }
}
