class nagios::params {
    $basedir = $operatingsystem ? {
        default => '/etc/nagios3',
    }

    $configdir = $operatingsystem ? {
        default => "/etc/nagios3/conf.d",
    }

    $configfile = $operatingsystem ? {
        default => '/etc/nagios3/nagios.cfg',
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

    $hasstatus = $operatingsystem ? {
        default => true,
    }

    $hostgroups = $nagios_hostgroups ? {
        ''      => 'all',
        default => $nagios_hostgroup,
    }

    $packagename = $operatingsystem ? {
        default => 'nagios3-core',
    }

    $packagename_plugins = $operatingsystem ? {
        default => 'nagios-plugins-extra'
    }

    $processname = $operatingsystem ? {
        default => 'nagios',
    }

    $servicename = $operatingsystem ? {
        default => 'nagios3',
    }

    $plugindir = $operatingsystem ? {
        default => '/usr/lib/nagios/plugins',
    }
}
