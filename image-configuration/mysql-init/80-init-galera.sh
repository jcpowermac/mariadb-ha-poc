#!/bin/bash

if [ -v INIT_GALERA ];
    then
        echo "Init galera finished - shutting down mariadb"
        shutdown_local_mysql
        # should be done and we don't want the script to continue
        exit 0
fi

WSREP_ON=1
NAMESPACE="rhscl-mariadb"

# Retrieve the SRV records from DNS
SRVSTRING=`host -t SRV ${NAMESPACE}`
FQDN=()

readarray -t SRV <<< "$SRVSTRING"

for entry in "${SRV[@]}"
do
    temp=$(echo $entry | awk '{print $8}')
    FQDN+=("${temp:0:-1}")
done

if [ "${#FQDN[@]}" = 1 ]; then
    NODES=""
else
    NODES=$(IFS=,; echo "${FQDN[*]}")
fi

export NODES
export WSREP_ON

process_extending_config_files ${APP_DATA}/mysql-cfg/ ${CONTAINER_SCRIPTS_PATH}/cnf/
