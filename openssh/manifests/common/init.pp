class openssh::common::init {
	include openssh::params
	include openssh::common::install
	include openssh::common::config
	include openssh::common::service
}
