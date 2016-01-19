Includes tools for secrets generation.

* [pwgen](http://linux.die.net/man/1/pwgen)
* [mkpasswd](http://linux.die.net/man/1/mkpasswd)

Based on [alpine](https://hub.docker.com/_/alpine/) image.

## Build locally

```
$ cd bosh-init
$ docker build -t mksecrets .
```

## Run

```
docker run -i -t mksecrets pwgen
docker run -i -t mksecrets sh -c "echo mysecret | mkpasswd -m sha-512"
```
