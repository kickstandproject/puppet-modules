class reprepro::params {
    $distributions = $reprepro_distributions ? {
        ''      => [
            'precise'
        ],
        default => $reprepro_distributions,
    }

    $homedir = $operatingsystem ? {
        default => '/var/lib/reprepro',
    }

    $packagename = $operatingsystem ? {
        default => 'reprepro',
    }

    $user = $reprepro_user ? {
        ''      => 'reprepro',
        default => $reprepro_user,
    }
}
