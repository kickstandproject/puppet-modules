class openldap::classes::common {
	include openldap::params
	include openldap::classes::install
	include openldap::classes::config
	include openldap::classes::service
}
