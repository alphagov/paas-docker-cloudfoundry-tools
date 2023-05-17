# Concourse KeyVal Resource

This image is similar to keyval-resource for using the keyval resource in concourse, but includes some extra functionality around exposing build metadata, which can be useful in pipeline managament

## Build locally

```
$ cd concourse-keyval-resource
$ docker build -t concourse-keyval-resource .
```

## Run

```
docker run -it concourse-keyval-resource /bin/bash
```
