# Bosh CLI V2

This image is for building containers for accessing Bosh programmatically or CF from our pipelines using the [Bosh v2 CLI](https://bosh.io/docs/cli-v2.html) or using the [CF Cli](). Logging into Bosh, or CF, and managing secrets is to be done in the pipelines using this image.

## Build locally

```
$ cd bosh-cli-v2
$ docker build -t bosh-cli-v2-cf-cli .
```

## Run

```
docker run -i -t bosh-cli-v2-cf-cli bosh --version;cf --version
```