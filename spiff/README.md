Installs [spiff](https://github.com/cloudfoundry-incubator/spiff).

It uses alpine linux image as base and deploys statically compiled spiff release which runs directly.

## Requirements
spiff processes manifest files. To make them available to spiff inside the container, they must be mounted via one or several volumes.

## Build locally

```
$ cd spiff
$ docker build -t spiff .
```

or

```
$ rake build:spiff
```

## Run

### Locally

```
$ docker run -v /path/to/local/manifests:/manifests spiff spiff merge /manifests/base-manifest.yml /manifests/stub.yml
```

### From Dockerhub image

```
$ docker run -v /path/to/local/manifests:/manifests orangecloudfoundry/spiff spiff merge /manifests/base-manifest.yml /manifests/stub.yml

```
