class jenkins::common::apache {
    apache::function::virtualhost-proxy { $fqdn:
    }
}
