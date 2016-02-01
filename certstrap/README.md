Installs [certstrap](https://github.com/square/certstrap/).

It uses a go alpine linux image as base to be able to compile go and keep a small image size.

## Requirements

certstrap is a simple certificate manager based on openssl

## Build locally

```
$ cd certstrap
$ docker build -t certstrap .
```

## Run

### Locally

```
$ docker run -v certstrap certstrap -h
```

### From Dockerhub image

```
$ docker run -v governmentpaas/certstrap certstrap -h

```
