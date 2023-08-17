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
bosh create-env minimal.yml
set -e

# We only care about the compiled_packages.json and blobs folder.
# Keeping this about can cause issues if the cpi has packages that
# are not idempotent.
rm -r /root/.bosh/installations/44f01911-a47a-4a24-6ca3-a3109b33f058/packages

echo "...done"
