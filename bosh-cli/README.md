# Bosh CLI

This image is for building containers for accessing Bosh programmatically from our pipelines. Logging into Bosh and managing secrets is to be done in the pipelines using this image.

## Build locally

```
$ cd bosh-cli
$ docker build -t bosh-cli .
```

## Run

```
docker run -i -t bosh-cli bosh --version
```
