#!/bin/bash

if [ -z ${INIT_GALERA} ];
    then
        echo "Shutting down mariadb"
        shutdown_local_mysql
        # should be done and we don't want the script to continue
        exit 0
fi
