class git::params {
    $packagename = $operatingsystem ? {
        default => 'git-core',
    }
}
