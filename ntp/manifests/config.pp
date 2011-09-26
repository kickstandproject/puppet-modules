class ntp::config {
	file { $ntp::params::ntp_config_name:
		ensure => present,
		owner => root,
		group => root,
		mode => 0644,
		source => "puppet:///modules/ntp/etc/ntp.conf",
		require => Class["ntp::install"],
		notify => Class["ntp::service"],
	}
}
