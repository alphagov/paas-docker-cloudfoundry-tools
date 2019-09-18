#!/bin/bash

set -eu

if [ -z "${BOSH_ID_RSA:-}" ] || [ -z "${BOSH_IP:-}" ] || [ -z "${BOSH_ENVIRONMENT:-}" ] || [ -z "${BOSH_CA_CERT:-}" ]; then
  echo "WARNING: You need to set BOSH_ID_RSA, BOSH_IP, BOSH_ENVIRONMENT and BOSH_CA_CERT."
  exit 1
  exit 1
fi

echo "$BOSH_ID_RSA" | base64 -d > /tmp/bosh_id_rsa && chmod 400 /tmp/bosh_id_rsa

ssh -fNC -4 -D 25555 \
  -o ExitOnForwardFailure=yes \
  -o StrictHostKeyChecking=no \
  -o UserKnownHostsFile=/dev/null \
  -o ServerAliveInterval=30 \
  -q \
  "vcap@$BOSH_IP" -i /tmp/bosh_id_rsa

export BOSH_ALL_PROXY="socks5://localhost:25555"
export BOSH_GW_HOST=$BOSH_IP
export BOSH_GW_USER=vcap
export BOSH_GW_PRIVATE_KEY=/tmp/bosh_id_rsa

exec bash "${@}"
