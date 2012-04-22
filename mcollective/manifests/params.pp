class mcollective::params {
	$packagename = $operatingsystem ? {
		default => 'mcollective',
	}

	$packagename_common = $operatingsystem ? {
		default => 'mcollective-common',
	}

	$servicename = $operatingsystem ? {
		default => 'mcollective',
	}

	$processname = $operatingsystem ? {
		default => 'mcollectived',
	}

	$hasstatus = $operatingsystem ? {
		default => true,
	}

	$server_cfg = $operatingsystem ? {
		default => '/etc/mcollective/server.cfg',
	}

	$client_cfg = $operatingsystem ? {
		default => '/etc/mcollective/client.cfg',
	}

	$libdir = $operatingsystem ? {
		default => '/usr/share/mcollective/plugins',
	}

	$logfile = $operatingsystem ? {
		default => '/var/log/mcollective.log',
	}

	$psk_security_code = $mcollective_psk_security_code ? {
		'' => '488b6f9c6e94ac24140094117e4c9cf2',
		default => $mcollective_psk_security_code,
	}

	$stomp_host = $mcollective_stomp_host ? {
		'' => 'puppet',
		default => $mcollective_stomp_host,
	}

	$stomp_port = $mcollective_stomp_port ? {
		'' => '6163',
		default => $mcollective_stomp_port,
	}

	$stomp_user = $mcollective_stomp_user ? {
		'' => 'mcollective',
		default => $mcollective_stomp_user,
	}

	$stomp_password = $mcollective_stomp_password ? {
		'' => 'welcome',
		default => $mcollective_stomp_password,
	}

	$registerinterval = $mcollective_registerinterval ? {
		'' => '300',
		default => $mcollective_registerinterval,
	}
}
