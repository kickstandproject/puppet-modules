class openldap::server inherits openldap::classes::common {
	if ($firewall == 'yes') {
		include openldap::classes::firewall
	}
}
