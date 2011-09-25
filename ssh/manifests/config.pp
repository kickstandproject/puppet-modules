class ssh::config {
	file { $ssh::params::ssh_config_name:
		ensure => present,
		owner => 'root',
		group => 'root',
		mode => 0600,
		source => "puppet:///modules/ssh/etc/sshd_config",
		require => Class["ssh::install"],
		notify => Class["ssh::service"],
	}
}
