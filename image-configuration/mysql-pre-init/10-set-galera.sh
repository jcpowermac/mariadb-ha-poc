#!/bin/bash

set -x

# Get the namespace where these pods are running
NAMESPACE=`cat /run/secrets/kubernetes.io/serviceaccount/namespace`

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
