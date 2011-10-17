class openssh::server {
	include openssh::params
	include openssh::install
	include openssh::config
	include openssh::service
}
