Container for running Bosh SSH.


* `BOSH` CLI
* `SSH`

## Build locally

```
$ cd bosh-cli
$ docker build -t bosh-cli .
```

## Run

```
docker run -i -t bosh-cli bosh --version
```
