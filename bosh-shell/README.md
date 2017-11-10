# Bosh Shell

An image for creating containers for operators to use on their local machine for interacting with the Bosh CLI and SSH.

## Build locally

```
$ cd bosh-shell
$ docker build -t bosh-shell .
```

## Run

The containers need to be run using the script in paas-bootstrap: `paas-bootstrap/scripts/bo.sh`. This is because the `ENTRYPOINT` of the container has a dependency on the Bosh IP and Bosh VM private SSH key. On startup, the container will locally forward the Bosh port (25555).

## Bosh CLI

Bosh CLI commands will work from the container. However, you will need to target the deployment first:

```
bosh download manifest "$DEPLOY_ENV" manifest.yml
bosh deployment manifest.yml
```

## Bosh SSH

A script called 'bosh-ssh' will be available on the `PATH` in the container. This is a simple wrapper for the `bosh ssh` command which adds the gateway details for you, as the Bosh VM will act as an SSH gateway to the Bosh-managed VMs. Run `bosh-ssh` in the container for usage details.
