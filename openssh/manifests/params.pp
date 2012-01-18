class openssh::params {
    $packagename = $operatingsystem ? {
        default => 'openssh-server',
    }

    $servicename = $operatingsystem ? {
        default => 'ssh',
    }

    $processname = $operatingsystem ? {
        default => 'sshd',
    }

    $hasstatus = $operatingsystem ? {
        default => true,
    }

    $configfile = $operatingsystem ? {
        default => '/etc/ssh/sshd_config',
    }

    $configfile_mode = $operatingsystem ? {
        default => '0600',
    }

    $configfile_owner = $operatingsystem ? {
        default => 'root',
    }

    $configfile_group = $operatingsystem ? {
        default => 'root',
    }

    $configdir = $operatingsystem ? {
        default => '/etc/ssh',
    }

    $port = $openssh_port ? {
        ''      => '22',
        default => $openssh_port,
    }

    $password_auth = $openssh_password_auth ? {
        ''      => 'no',
        default => $openssh_password_auth,
    }

    $permit_root = $openssh_permit_root ? {
        ''      => 'no',
        default => $openssh_permit_root,
    }
}
