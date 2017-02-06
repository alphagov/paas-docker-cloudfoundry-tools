Container for running CloudFoundry client.

It includes some other packages commonly used when deploying CF apps:

* `cf` CLI
* `curl`
* `unzip`
* `git`

## Build locally

```
$ cd cf-cli
$ docker build -t cf-cly .
```

## Run

```
docker run -i -t cf-cli cf --version
docker run -i -t cf-cli curl --version
docker run -i -t cf-cli unzip -v
docker run -i -t cf-cli git --version
```
