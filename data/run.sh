#!/bin/bash
#set -e
CONFIG_PATH=/data/options.json
cd /usr/local/bin
HTTPPORT="$(jq --raw-output '.httpport' $CONFIG_PATH)"
SERIAL="$(jq --raw-output '.serial' $CONFIG_PATH)"
MODE="$(jq --raw-output '.mode' $CONFIG_PATH)"
export GIN_MODE=$MODE
#echo $GIN_MODE
#echo $HTTPPORT
#echo $SERIAL
./infinitive -httpport=${HTTPPORT} -serial=${SERIAL}
