define mysql::functions::grant(
    $db_name,
    $db_user,
    $db_password,
    $db_privileges = "ALL",
    $db_server = "localhost",
    $grant_filepath = "/root"
) {
    require mysql::server

    if ($db_name == '*') {
        $mysql_grant_file = "mysqlgrant-${db_user}-${db_server}-all.sql"
    } else {
        $mysql_grant_file = "mysqlgrant-${db_user}-${db_server}-${db_name}.sql"
    }

    file { $mysql_grant_file:
        ensure   => present,
        content  => template('mysql/root/grant.erb'),
        group    => root,
        mode     => 0600,
        owner    => root,
        path     => "${grant_filepath}/${mysql_grant_file}",
    }

    exec { "mysqlgrant-${db_user}-${db_server}-${db_name}":
        command => "/usr/bin/mysql --defaults-file=/root/.my.cnf -uroot < \
            ${grant_filepath}/${mysql_grant_file}",
        subscribe   => File[$mysql_grant_file],
        refreshonly => true,
        require     => File['/root/.my.cnf'],
    }
}

# vim:sw=4:ts=4:expandtab:textwidth=79
