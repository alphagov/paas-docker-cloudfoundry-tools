Container for running Bosh SSH.


* `BOSH` CLI
* `SSH`

Based on the [ruby:slim](https://hub.docker.com/_/ruby/) image.

## Build locally

```
$ cd bosh-cli
$ docker build -t bosh-cli .
```

## Run

```
docker run -i -t bosh-cli bosh --version
```
