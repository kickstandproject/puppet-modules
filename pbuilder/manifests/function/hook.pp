define pbuilder::function::hook(
    $ensure,
    $content
) {
    include pbuilder::common::config

    file { "${pbuilder::params::cachedir}/hook.d/${name}":
        ensure  => $ensure,
        content => $content,
        mode    => '0755',
        require => File["${pbuilder::params::cachedir}/hook.d"],
    }
}
