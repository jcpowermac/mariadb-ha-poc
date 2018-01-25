#!/bin/bash

if [ -v INIT_GALERA ];
    then
        echo "Init galera finished - shutting down mariadb"
        shutdown_local_mysql
        # should be done and we don't want the script to continue
        exit 0
fi
