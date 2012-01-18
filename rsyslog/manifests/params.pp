class rsyslog::params {
    $packagename = $operatingsystem ? {
        default => 'rsyslog-relp',
    }

    $packagename_mysql = $operatingsystem ? {
        default => 'rsyslog-mysql',
    }

    $servicename = $operatingsystem ? {
        default => 'rsyslog',
    }

    $processname = $operatingsystem ? {
        default => 'rsyslogd',
    }

    $hasstatus = $operatingsystem ? {
        default => true,
    }

    $configfile = $operatingsystem ? {
        default => '/etc/rsyslog.conf',
    }

    $configfile_mode = $operatingsystem ? {
        default => '0644',
    }

    $configfile_owner = $operatingsystem ? {
        default => 'root',
    }

    $configfile_group = $operatingsystem ? {
        default => 'root',
    }

    $configdir = $operatingsystem ? {
        default => '/etc/rsyslog.d',
    }

    $db = $rsyslog_db ? {
        mysql   => 'mysql',
        default => '',
    }

    $db_name = $rsyslog_db_name ? {
        ''      => 'Syslog',
        default => $rsyslog_db_name,
    }

    /* XXX TODO Fixme! */
    $db_password = $rsyslog_db_password ? {
        ''      => 'bob',
        default => $rsyslog_db_password,
    }

    $db_server = $rsyslog_db_server ? {
        ''      => 'localhost',
        default => $rsyslog_db_server,
    }

    $db_user = $rsyslog_db_user ? {
        ''      => 'rsyslog',
        default => $rsyslog_db_user,
    }
}
