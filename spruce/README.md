Installs [spruce](https://github.com/geofffranks/spruce).

It uses alpine linux image as base and deploys statically compiled spruce release which runs directly.

## Requirements
Spruce processes manifest files. To make them available to spruce inside the container, they must be mounted via one or several volumes.

## Build locally

```
$ cd spruce
$ docker build -t spruce .
```

or

```
$ rake build:spruce
```

## Run

### Locally

```
$ docker run -v /path/to/local/manifests:/manifests spruce spruce merge /manifests/base-manifest.yml /manifests/stub.yml
```

### From Dockerhub image

```
$ docker run -v /path/to/local/manifests:/manifests governmentpaas/spruce spruce merge /manifests/base-manifest.yml /manifests/stub.yml

```
