class puppet::common::init {
	include puppet::params
	include puppet::common::install
	include puppet::common::config
	include puppet::common::service
}
