define monitor::process(
	$ensure	= present,
	$process
	) {

	if ($fqdn != $nagios_nsca_server) {
		nagios::service::nsca { "check_procs_$process!1!1":
			description	=> "Check Process $process",
			ensure		=> $ensure,
			server		=> "$nagios_nsca_server",
		}
	}

	nagios::command { "check_procs_$process":
		command_line	=> "/usr/lib/nagios/plugins/check_procs -C $process -w '\$ARG1$:' -c '\$ARG2$:'"
	}
}
