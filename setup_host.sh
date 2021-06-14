#!/bin/bash

set -euo pipefail

HOST=alertbroker-scratch.lsst.codes

echo "copying files up"
ssh $HOST 'mkdir -p /tmp/provision_scripts'
rsync kafka.service zookeeper.service install_broker.sh $HOST:/tmp/provision_scripts
rsync -r ./config $HOST:/tmp/provision_scripts

echo "executing remote install"
ssh $HOST 'cd /tmp/provision_scripts && sudo ./install_broker.sh'
