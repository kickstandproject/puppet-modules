class openvpn::params {
    $configdir = $operatingsystem ? {
        default => '/etc/openvpn',
    }

    $configfile_group = $operatingsystem ? {
        default => 'root',
    }

    $configfile_mode = $operatingsystem ? {
        default => '0644',
    }

    $configfile_owner = $operatingsystem ? {
        default => 'root',
    }

    $defaultfile = $operatingsystem ? {
        default => '/etc/default/openvpn',
    }

    $hasstatus = $operatingsystem ? {
        default => true,
    }

    $packagename = $operatingsystem ? {
        default => 'openvpn',
    }

    $processname = $operatingsystem ? {
        default => 'openvpn',
    }

    $servicename = $operatingsystem ? {
        default => 'openvpn',
    }
}
