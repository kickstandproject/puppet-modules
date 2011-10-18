class openssh::classes::common {
	include openssh::params
	include openssh::classes::install
	include openssh::classes::config
	include openssh::classes::service
}
