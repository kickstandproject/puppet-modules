class ssh::params {
	case $operatingsystem {
		Ubuntu: {
			$ssh_package_name = 'openssh-server'
			$ssh_config_name = '/etc/ssh/sshd_config'
			$ssh_service_name = 'ssh'
		}
	}
}
