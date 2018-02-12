#!/bin/bash

if [ -v INIT_GALERA ];
    then
        echo "Init galera finished - shutting down mariadb"
        shutdown_local_mysql
        # should be done and we don't want the script to continue
        exit 0
fi

WSREP_ON=1
export WSREP_ON

process_extending_config_files ${APP_DATA}/mysql-cfg/ ${CONTAINER_SCRIPTS_PATH}/cnf/
