class jenkins::params {
    $packagename = $operatingsystem ? {
        default => 'jenkins',
    }

    $servicename = $operatingsystem ? {
        default => 'jenkins',
    }

    $processname = $operatingsystem ? {
        default => 'jenkins',
    }

    $hasstatus = $operatingsystem ? {
        default => true,
    }

    $configfile = $operatingsystem ? {
        default => '/etc/ssh/sshd_config',
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
        default => '/var/lib/jenkins',
    }

    $defaultfile = $operatingsystem ? {
        default => '/etc/default/jenkins',
    }

    $port = $jenkins_port ? {
        ''      => '8080',
        default => $jenkins_port,
    }
}
