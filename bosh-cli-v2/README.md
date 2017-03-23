Container for running Bosh SSH.


* `BOSH` CLI
* `SSH`

## Build locally

```
$ cd bosh-cli-v2
$ docker build -t bosh-cli-v2 .
```

## Run

```
docker run -i -t bosh-cli-v2 bosh --version
```
