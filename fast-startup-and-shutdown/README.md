# Fast Startup and Shutdown

This image is for building a container to run fast-startup-and-shutdown, which requires bosh-cli, awscli and curl. It uses bosh-cli-v2 as a base image and installs awscli on top using pip, and curl using apt.

## Build locally

```
$ cd fast-startup-and-shutdown
$ docker build -t fast-startup-and-shutdown .
```

## Run

```
docker run -it fast-startup-and-shutdown /bin/bash -c "bosh --version && aws --version && curl --version"
```
