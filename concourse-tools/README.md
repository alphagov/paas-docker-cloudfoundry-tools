# Concourse Tools

This image is for building a container to run concourse tasks, which require various tools including: bosh-cli, awscli and curl. It uses bosh-cli-v2 as a base image and installs awscli on top using pip, and curl using apt.

## Build locally

```
$ cd concourse-tools
$ docker build -t concourse-tools .
```

## Run

```
docker run -it concourse-tools /bin/bash -c "bosh --version"
```
