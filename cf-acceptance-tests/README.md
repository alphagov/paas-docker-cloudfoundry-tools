Container for running CloudFoundry acceptance tests.

It includes all the dependencies of the [CF test
helpers](https://github.com/cloudfoundry-incubator/cf-test-helpers):

* Go 1.5 compiler
* `cf` CLI
* `curl`
* [`godep`](github.com/tools/godep)

Based on the [golang](https://hub.docker.com/_/golang/) image.

## Build locally

```
$ cd cf-acceptance-tests
$ docker build -t cf-acceptance-tests .
```

## Run

```
docker run -i -t cf-acceptance-tests go version
docker run -i -t cf-acceptance-tests cf --version
docker run -i -t cf-acceptance-tests curl --version
```
