Configuring OpenLDAP
====================

Setting up OpenLDAP should be as simple as modifying your node manifest and adding
the appropriate variables and their values. The following is the list of variables
available to you.

Variables
---------
# Configuration file for slapd
`$openldap_configfile = '/etc/ldap/slapd.conf'`

# Default system user the configuration files will be owned by
`$openldap_slapd_user = 'openldap'`

# Default system group the configuration files will be owned by
`$openldap_slapd_group = 'openldap'`

# Sentinal file
`$openldap_slapd_sentinal_file = '/etc/ldap/noslapd'`

# PID file
`$openldap_slapd_pidfile = '/var/run/slapd.pid'`

# Staging path for configuration of openldap
`$openldap_staging_path = '/etc/puppet/modules/openldap/'`

# Location of the schema files (.ldif)
`$openldap_schema_path = '/etc/ldap/schema/'`

# Operating system configuration file. Right now we only deal with Ubuntu.
`$openldap_operatingsystem_slapd_config = '/etc/default/slapd'`

# Frontend ldif file -- this comes from a puppet template
`$openldap_frontend_ldif = '/etc/puppet/modules/openldap/frontend.ldif'`

# Initial configuration script as pulled down from a puppet template
`$openldap_initial_config_script = '/etc/puppet/modules/openldap/initial_config.sh'`

# Hidden file containing the root passwd for configuration setup (not yet working)
`$openldap_rootpw_file = '/etc/puppet/modules/openldap/.ldap_rootpw'`

# Domain for the server. Replace .example_domain.lan as dc=example_domain,dc=lan
`$openldap_domain = 'dc=example_domain,dc=lan'`

# Left-most top level domain
`$openldap_dc = 'example_domain'`

# Root Admin Username
`$openldap_rootdn = 'admin'`

# Root Admin Password Created With 'slappasswd'
`$openldap_rootpw = '{SSHA}JK+xflJwRZY7mOh8XHLGsBoiLBGpUJPA'`

# Root Admin Password In Plaintext (Required for now for ldapadd)
`$openldap_plain_passwd = 'welcome'`

# Organization Name
`$openldap_organization = 'Example Industries Ltd'`

# Server Description
`$openldap_description = 'EI Ltd LDAP Server'`

# Administration User Description
`$openldap_admin_description = 'LDAP Administrator'`

# Administration Password (only used for initial schema import)
`$openldap_admin_passwd = 'welcome'`
