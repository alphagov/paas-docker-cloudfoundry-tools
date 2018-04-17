# Bosh Shell

An image for creating containers for operators to use on their local machine for interacting with the Bosh CLI and SSH.

## Build locally

```
$ cd bosh-shell
$ docker build -t bosh-shell .
```

## Run

The containers need to be run using the bosh-cli `make` target in paas-bootstrap. This is because the `ENTRYPOINT` of the container has a dependency on the Bosh IP and Bosh VM private SSH key. On startup, the container will locally forward the Bosh port (25555).
