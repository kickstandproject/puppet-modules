#!/bin/bash
set -x

MODULE_PATH=/etc/puppet/modules

declare -A MODULES
MODULES["kickstandproject-ntp"]="0.0.1"
MODULES["kickstandproject-puppet"]="0.0.1"
MODULES["kickstandproject-ssh"]="0.0.2"

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
            puppet module install $MOD --version ${MODULES[$MOD]} --force >/dev/null
        fi
#    fi
done
