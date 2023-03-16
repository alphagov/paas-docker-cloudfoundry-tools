# Kipper

This image is for building a container to run Kipper, which requires both Bosh and awscli. It uses bosh-cli-v2 as a base image and installs awscli on top using pip.

## Build locally

```
$ cd kipper
$ docker build -t kipper .
```

## Run

```
docker run -it kipper /bin/bash -c "bosh --version && aws --version"
```
