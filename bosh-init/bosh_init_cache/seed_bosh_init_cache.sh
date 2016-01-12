#!/bin/sh

set -e
set -u

WORKING_DIR=$(cd $(dirname "${0}") && pwd)

cd "${WORKING_DIR}"

sed "s|BOSH_AWS_CPI_URL|${BOSH_AWS_CPI_URL}|; s|BOSH_AWS_CPI_CHECKSUM|${BOSH_AWS_CPI_CHECKSUM}|" minimal_in.yml > minimal.yml

echo "###############################################"
echo "# Compiling AWS CPI release...                #"
echo "# The deploy will error, but that's expected. #"
echo "###############################################"

set +e
bosh-init deploy minimal.yml
set -e

echo "...done"
