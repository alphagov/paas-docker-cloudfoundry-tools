Includes curl with SSL and openssl support, including the `openssl` command.

It also includes the ca-certificates.

Based on [alpine](https://hub.docker.com/_/alpine/) image.

## Build locally

```
$ cd bosh-init
$ docker build -t curl-ssl .
```

## Run

```
docker run -i -t curl-ssl curl https://www.google.com
docker run -i -t curl-ssl openssl
```
