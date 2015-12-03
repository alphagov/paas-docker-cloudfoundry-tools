Installs [spruce](https://github.com/geofffranks/spruce).

It uses a go alpine linux image as base to be able to compile go and keep a small image size.

## Requirements
Spruce processes manifest files. To make them available to spruce inside the container, they must be mounted via one or several volumes.

## Build locally

```
$ cd spruce
$ docker build -t spruce .
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
