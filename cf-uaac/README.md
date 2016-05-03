Container for running uaac cli.


* `uaac` CLI

Based on the [ruby:slim](https://hub.docker.com/_/ruby/) image.

## Build locally

```
$ cd cf-uaac
$ docker build -t cf-uaac .
```

## Run

```
docker run -i -t cf-uaac uaac --version
```
