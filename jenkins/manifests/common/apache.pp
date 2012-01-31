class jenkins::common::apache {
    require jenkins::params

    apache::function::virtualhost-proxy { $fqdn:
        port => $jenkins::params::port,
    }
}
