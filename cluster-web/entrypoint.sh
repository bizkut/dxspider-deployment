#!/bin/sh

sed -e 's/\("host":\)"localhost"/\1"${CLUSTERWEB_DB_CONTAINERHOSTNAME}"/' \
    -e 's/\("user":\)"foo"/\1"${CLUSTERWEB_USER}"/' \
    -e 's/\("passwd":\)"bar"/\1"${CLUSTERWEB_PASSWORD}"/' \
    -e 's/\("db":\)"dxcluster"/\1"${CLUSTERWEB_DATABASE}"/' \
    -e 's/\("mycallsign":\)"XXXXXX"/\1"${CLUSTER_CALLSIGN}"/' \
    -e 's/\("mail":\)"foo@bar.com"/\1"${CLUSTER_SYSOP_EMAIL}"/' \
    -e 's/\("host":\) "mysite"/\1 "${CLUSTER_DX_HOSTNAME}"/' \
    -e 's/\("port":\) "7300"/\1 "${CLUSTER_PORT}"/' \
    -e 's/\("user":\) "myuser"/\1 "${CLUSTER_SYSOP_CALLSIGN}"/' \
    -e 's/\("password":\) ""/\1 "${CLUSTER_SYSOP_PASSWORD}"/' /app/cfg/config.json.template > /app/cfg/config.json

python3 /app/wsgi.py
