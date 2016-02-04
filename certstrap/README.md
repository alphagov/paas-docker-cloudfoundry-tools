Installs [certstrap](https://github.com/square/certstrap/).

It uses a go alpine linux image as base to be able to compile go and keep a small image size.

## Requirements and tools installed

certstrap is a simple certificate manager based on `openssl`. In order to
use scripts which interact with HTTP APIs (e.g. S3) `curl` and
the `ca-certificates` are installed.

## Build locally

```
$ cd certstrap
$ docker build -t certstrap .
```

## Run

### Locally

```
$ docker run -v certstrap certstrap -h
$ docker run -v certstrap curl
```

### From Dockerhub image

```
$ docker run -v governmentpaas/certstrap certstrap -h
$ docker run -v governmentpaas/certstrap curl -h
```
