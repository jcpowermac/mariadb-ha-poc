#!/bin/bash

set -x
#cp -R /etc/opt/rh/rh-mariadb102/my.* /etc/


NAMESPACE=`cat /run/secrets/kubernetes.io/serviceaccount/namespace`

SRVSTRING=`host -t SRV galera`
#SRVSTRING=`host -t SRV ${NAMESPACE}`
PETSARRAY=()

readarray -t SRV <<< "$SRVSTRING"

for pod in "${SRV[@]}"
do
    temp=$(echo $pod | awk '{print $8}')
    echo $temp
    PETSARRAY+=("${temp:0:-1}")
done

PETS=$(IFS=,; echo "${PETSARRAY[*]}")
export PETS

#SAVE_ARGS=$@
#export SAVE_ARGS
#set -- "$@" "--wsrep_on=OFF"

