#!/bin/bash

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

MODULE_PATH=/etc/puppet/modules

declare -A MODULES
MODULES["kickstandproject-apt"]="0.0.1"
MODULES["kickstandproject-dahdi"]="0.0.2"
MODULES["kickstandproject-jenkins"]="0.0.1"
MODULES["kickstandproject-jenkins_job_builder"]="0.0.3"
MODULES["kickstandproject-network"]="0.0.1"
MODULES["kickstandproject-ntp"]="0.0.3"
MODULES["kickstandproject-puppet"]="0.0.5"
MODULES["kickstandproject-ssh"]="0.0.3"
MODULES["kickstandproject-sudoers"]="0.0.1"
MODULES["kickstandproject-timezone"]="0.0.3"
MODULES["puppetlabs-stdlib"]="2.2.0"

MODULE_LIST=`puppet module list`

if ! [ -d ${MODULE_PATH} ]; then
    mkdir -p ${MODULE_PATH}
fi
cd ${MODULE_PATH}

for MOD in ${!MODULES[*]} ; do
    # If the module at the current version does not exist upgrade or install it
    if ! echo $MODULE_LIST | grep "$MOD.*${MODULES[$MOD]}" >/dev/null 2>&1
    then
        # Attempt module upgrade. If that fails try installing the module.
#        if ! puppet module upgrade $MOD --version ${MODULES[$MOD]} >/dev/null 2>&1
#        then
            # This will get run in cron, so silence non-error output
            puppet module install $MOD --version ${MODULES[$MOD]} --force >/dev/null 2>&1
        fi
#    fi
done
