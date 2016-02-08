Includes the Cloudfoundry CLI (`cf`), as well as a Go 1.5 runtime

Based on the [golang](https://hub.docker.com/_/golang/) image.

## Build locally

```
$ cd cf-cli
$ docker build -t cf-cli .
```

## Run

```
docker run -i -t cf-cli go version
docker run -i -t cf-cli cf --version
```
