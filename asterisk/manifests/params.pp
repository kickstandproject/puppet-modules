class asterisk::params {
	$packagename = $operatingsystem ? {
		default => 'asterisk',
	}

	$servicename = $operatingsystem ? {
		default => 'asterisk',
	}

	$processname = $operatingsystem ? {
		default => 'asterisk',
	}

	$hasstatus = $operatingsystem ? {
		default => true,
	}
}
