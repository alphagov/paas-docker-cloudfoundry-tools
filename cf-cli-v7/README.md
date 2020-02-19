Container for running CloudFoundry client.

This is the non-stable version 7 of the CLI

It includes some packages commonly used when deploying CF apps:

* `cf` CLI
* `curl`
* `unzip`
* `git`

It also includes some commonly-used `cf` plugins:

* [conduit](https://github.com/alphagov/paas-cf-conduit)

## Build locally

```
$ cd cf-cli-v7
$ docker build -t cf-cli-v7 .
```

## Run

```
docker run -i -t cf-cli-v7 cf --version
docker run -i -t cf-cli-v7 curl --version
docker run -i -t cf-cli-v7 unzip -v
docker run -i -t cf-cli-v7 git --version
```
