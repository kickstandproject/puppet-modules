class ntp::params {
    $packagename = $operatingsystem ? {
        default => 'ntp',
    }

    $servicename = $operatingsystem ? {
        default => 'ntp',
    }

    $processname = $operatingsystem ? {
        default => 'ntpd',
    }

    $hasstatus = $operatingsystem ? {
        default => true,
    }

    $configfile = $operatingsystem ? {
        default => '/etc/ntp.conf',
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
        default => '/etc/ntp',
    }
}
