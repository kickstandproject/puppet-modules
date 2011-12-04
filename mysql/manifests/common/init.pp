class mysql::common::init {
	include mysql::params
	include mysql::common::install
	include mysql::common::config
	include mysql::common::service
}
