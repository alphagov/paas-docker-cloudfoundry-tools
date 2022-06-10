# Image: Ruby Base

Provides Ruby. See the Dockerfile to check which version.

This is a base image for building other containers from.

## Build locally

```
$ cd psql
$ docker build -t ruby .
```

## Run

```
docker run -i ruby irb
```
