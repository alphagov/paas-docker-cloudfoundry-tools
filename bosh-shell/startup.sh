#!/bin/bash

set -eu

if [ -z "${BOSH_ID_RSA:-}" ] || [ -z "${BOSH_IP:-}" ]; then
  echo "WARNING: You need to set BOSH_ID_RSA and BOSH_IP. You will not be logged into Bosh"
  exec bash
fi

echo "$BOSH_ID_RSA" | base64 -d > /tmp/bosh_id_rsa && chmod 400 /tmp/bosh_id_rsa

ssh -fNT -4 -L 25555:localhost:25555 \
  -o ExitOnForwardFailure=yes \
  -o StrictHostKeyChecking=no \
  -o UserKnownHostsFile=/dev/null \
  -o ServerAliveInterval=60 \
  "vcap@$BOSH_IP" -i /tmp/bosh_id_rsa

bosh -t localhost login admin -- "$BOSH_ADMIN_PASSWORD"
bosh target localhost

bosh download manifest "${BOSH_DEPLOYMENT}" "${BOSH_DEPLOYMENT}.yml"
bosh deployment "${BOSH_DEPLOYMENT}.yml"

exec bash --rcfile /bosh_wrapper.rc
