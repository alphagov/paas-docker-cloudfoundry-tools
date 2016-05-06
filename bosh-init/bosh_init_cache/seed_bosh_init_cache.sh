#!/bin/sh

set -e
set -u

WORKING_DIR=$(cd $(dirname "${0}") && pwd)

cd "${WORKING_DIR}"

sed "s|BOSH_AWS_CPI_URL|${BOSH_AWS_CPI_URL}|; s|BOSH_AWS_CPI_CHECKSUM|${BOSH_AWS_CPI_CHECKSUM}|" minimal_in.yml > minimal.yml

RED='\033[0;31m'
NO_COLOUR='\033[0m'

echo "${RED}"
echo "###############################################"
echo "# Compiling AWS CPI release...                #"
echo "# The deploy will error, but that's expected. #"
echo "###############################################"
echo "${NO_COLOUR}"

set +e
bosh-init deploy minimal.yml
set -e

echo "...done"
