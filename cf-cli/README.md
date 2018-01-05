Container for running CloudFoundry client.

It includes some packages commonly used when deploying CF apps:

* `cf` CLI
* `curl`
* `unzip`
* `git`

It also includes some commonly-used `cf` plugins:

* [blue-green-deploy](https://github.com/bluemixgaragelondon/cf-blue-green-deploy)
* [autopilot](https://github.com/contraband/autopilot)

## Build locally

```
$ cd cf-cli
$ docker build -t cf-cli .
```

## Run

```
docker run -i -t cf-cli cf --version
docker run -i -t cf-cli curl --version
docker run -i -t cf-cli unzip -v
docker run -i -t cf-cli git --version
```
