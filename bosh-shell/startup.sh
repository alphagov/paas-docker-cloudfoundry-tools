#!/bin/bash

set -eu

if [ -z "${USER_ID_RSA:-}" ] || [ -z "${BOSH_IP:-}" ] || [ -z "${BOSH_ENVIRONMENT:-}" ] || [ -z "${BOSH_CA_CERT:-}" ]; then
  echo "WARNING: You need to set USER_ID_RSA, BOSH_IP, BOSH_ENVIRONMENT and BOSH_CA_CERT."
  echo "You will not be logged into Bosh."
  exec bash
fi

echo "$USER_ID_RSA" | base64 -d > /tmp/user_id_rsa && chmod 400 /tmp/user_id_rsa

ssh -fNC -4 -D 25555 \
  -o ExitOnForwardFailure=yes \
  -o StrictHostKeyChecking=no \
  -o UserKnownHostsFile=/dev/null \
  -o ServerAliveInterval=30 \
  -q \
  "$USER"@"$BOSH_IP" -i /tmp/user_id_rsa

export BOSH_ALL_PROXY="socks5://localhost:25555"
export BOSH_GW_HOST=$BOSH_IP
export BOSH_GW_USER=$USER
export BOSH_GW_PRIVATE_KEY=/tmp/user_id_rsa

exec bash "${@}"
