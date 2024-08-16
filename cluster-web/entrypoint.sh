#!/bin/bash

# call signs should be all upper case
CLUSTER_CALLSIGN=$(echo ${CLUSTER_CALLSIGN} | tr '[a-z]' '[A-Z]')
CLUSTER_SYSOP_CALLSIGN=$(echo ${CLUSTER_SYSOP_CALLSIGN} | tr '[a-z]' '[A-Z]')
#CLUSTERWEB_DB_CONTAINERHOSTNAME=$(echo )
#CLUSTERWEB_USER=$(echo )
#CLUSTERWEB_PASSWORD=$(echo )
#CLUSTERWEB_DATABASE=$(echo )
#CLUSTER_SYSOP_EMAIL=$(echo )
#CLUSTER_DX_HOSTNAME=$(echo )
#CLUSTER_PORT=$(echo )
#CLUSTER_SYSOP_PASSWORD=$(echo )


# [ ! -f  /app/cfg/config.json -o "${OVERWRITE_CONFIG}" = "yes" ] && \
sed -e "s/\(\"host\":\).*$/\1\"${CLUSTERWEB_DB_CONTAINERHOSTNAME}\";/" \
    -e "s/\(\"user\"\).*$/\1\"${CLUSTERWEB_USER}\";/" \
    -e "s/\(\"passwd\"\).*$/\1\"${CLUSTERWEB_PASSWORD}\";/" \
 < /app/cfg/config.json.template > /app/cfg/config.json

cat /app/cfg/config.json
python3 /app/wsgi.py
