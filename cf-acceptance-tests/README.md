Container for running CloudFoundry acceptance tests.

It includes all the dependencies of the [CF test
helpers](https://github.com/cloudfoundry-incubator/cf-test-helpers):

* Go compiler
* `cf` CLI
* `curl`
* [`godep`](github.com/tools/godep)

Based on the [upstream image](https://hub.docker.com/r/relintdockerhubpushbot/cats-concourse-task/), which is
hosted on [GitHub](https://github.com/cloudfoundry/cats-concourse-task).

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
