class squid::params {
    $configdir = $operatingsystem ? {
        default => '/etc/squid3',
    }

    $configfile = $operatingsystem ? {
        default => '/etc/squid3/squid.conf',
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

    $hasstatus = $operatingsystem ? {
        default => true,
    }

    $packagename = $operatingsystem ? {
        default => 'squid3',
    }

    $processname = $operatingsystem ? {
        default => 'proxy',
    }

    $port = $squid_port ? {
        ''      => '3128',
        default => $squid_port,
    }

    $servicename = $operatingsystem ? {
        default => 'squid3',
    }
}
