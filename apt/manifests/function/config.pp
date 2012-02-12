define apt::function::config(
    $ensure,
    $content
) {
    require apt::client

    File {
        ensure  => present,
        group   => $apt::params::configfile_group,
        mode    => $apt::params::configfile_mode,
        owner   => $apt::params::configfile_owner,
    }

    file { "${apt::params::configfile_dir}/${name}":
        ensure  => $ensure,
        content => $content,
        require => File[$apt::params::configdir],
    }
}
