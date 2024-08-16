#!/bin/bash

# call signs should be all upper case
CLUSTER_CALLSIGN=$(echo ${CLUSTER_CALLSIGN} | tr '[a-z]' '[A-Z]')
CLUSTER_SYSOP_CALLSIGN=$(echo ${CLUSTER_SYSOP_CALLSIGN} | tr '[a-z]' '[A-Z]')

sed -e "s/\(\"host\"\:\).*$/\1\"${CLUSTERWEB_DB_CONTAINERHOSTNAME}\",/" \
    -e "s/\(\"user\"\:\).*$/\1\"${CLUSTERWEB_USER}\",/" \
    -e "s/\(\"passwd\"\:\).*$/\1\"${CLUSTERWEB_PASSWORD}\",/" \
    -e "s/\(\"db\"\:\).*$/\1\"${CLUSTERWEB_DATABASE}\"/" \
    -e "s/\(\"mycallsign\"\:\).*$/\1\"${CLUSTER_CALLSIGN}\",/" \
    -e "s/\(\"mail\"\:\).*$/\1\"${CLUSTER_SYSOP_EMAIL}\",/" \
    -e "s/\(\"interval\"\:\).*$/\1${SPIDERWEB_PAGEREFRESH_MS:-15000}/" \
    -e "s/\(\"telnet_host\"\:\).*$/\1\"${CLUSTER_DX_HOSTNAME}\",/" \
    -e "s/\(\"telnet_port\"\:\).*$/\1\"${CLUSTER_PORT}\",/" \
    -e "s/\(\"telnet_user\"\:\).*$/\1\"${SPIDERWEB_TELNET_USER}\",/" \
    -e "s/\(\"telnet_password\"\:\).*$/\1\"${SPIDERWEB_TELNET_PASSWORD}\"/" \
    -e "s/\(\"enable_cq_filter\"\:\).*$/\1\"${SPIDERWEB_ENABLE_CQFILTER:-n}\",/" \
 < /app/cfg/config.json.template > /app/cfg/config.json

# cat /app/cfg/config.json
python3 /app/wsgi.py
