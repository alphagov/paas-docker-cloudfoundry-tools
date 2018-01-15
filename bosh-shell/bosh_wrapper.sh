#!/bin/sh

if [ "$1" == "ssh" ]; then
  shift 1
  exec bosh ssh \
    --gateway_host "$BOSH_IP" \
    --gateway_user vcap \
    --gateway_identity_file /tmp/bosh_id_rsa \
    $*
else
  exec bosh $*
fi
