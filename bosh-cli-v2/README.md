Container for running Bosh SSH using [v2 cli](https://bosh.io/docs/cli-v2.html)


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
