class snmp::common::init {
	include snmp::params
	include snmp::common::install
	include snmp::common::config
	include snmp::common::service
}
