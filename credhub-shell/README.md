# Credhub Shell

An image for creating containers for operators to use on their local machine for interacting with the Credhub CLI, targeting the configured Credhub server.

The container mentions Bosh a lot because Credhub and the Bosh director are co-located.

## Build locally

```
$ cd credhub-shell
$ docker build -t credhub-shell .
```

## Run

The containers need to be run using the bosh-cli `make` target in paas-cf. This is because the `ENTRYPOINT` of the container has a dependency on the Bosh IP and Bosh VM private SSH key. On startup, the container will locally forward the Credhub port (25555).
