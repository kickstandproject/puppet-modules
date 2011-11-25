#!/bin/bash

echo "Starting script..."

echo "Recieved $# parameters."

ldap_rootdn=$1
ldap_domain=$2
ldap_plain_passwd=$3

echo "Adding schemas"

ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/ldap/schema/cosine.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/ldap/schema/nis.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/ldap/schema/inetorgperson.ldif

echo "Importing frontend.ldif"

ldapadd -x -D cn=$ldap_rootdn,$ldap_domain -w $ldap_plain_passwd -f frontend.ldif

echo "Script done!"
exit
