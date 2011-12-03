class asterisk::classes::monitor {
	include asterisk::params

	monitor::process { 'asterisk_process':
		process	=> "$asterisk::params::processname",
	}
}
