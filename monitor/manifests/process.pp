define monitor::process(
	$ensure	= present,
	$process
	) {
	nagios::service::nsca { "check_procs_$process":
		description	=> "Check Process $process",
		ensure		=> $ensure,
		server		=> "nagios_nsca_server",
	}

	nagios::command { "check_procs_$process":
		command_line	=> "/usr/lib/nagios/plugins/check_procs -C $process"
	}
}
