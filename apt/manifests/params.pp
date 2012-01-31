class apt::params {
    $packagename = $operatingsystem ? {
        default => 'python-software-properties',
    }

    $servicename = $operatingsystem ? {
        default => 'apt',
    }

    $processname = $operatingsystem ? {
        default => 'apt',
    }

    $hasstatus = $operatingsystem ? {
        default => true,
    }

    $components = $apt_components ? {
        ''      => 'main universe',
        default => $apt_components,
    }

    $configdir = $operatingsystem ? {
        default => '/etc/apt',
    }

    $configfile_dir = $operatingsystem ? {
        default => '/etc/apt/apt.conf.d',
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

    $mirror = $apt_mirror ? {
        ''      => 'ca.archive.ubuntu.com',
        default => $apt_mirror,
    }

    $mirror_protocol = $apt_mirror_protocol ? {
        ''      => 'http://',
        default => $apt_mirror_protocol,
    }
}
