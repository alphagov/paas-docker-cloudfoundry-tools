Installs Git with OpenSSH

Git also includes by default curl, OpenSSL and ca-certificates.

Based on [alpine](https://hub.docker.com/_/alpine/) image.

## Build locally

```
$ cd git-ssh
$ docker build -t git-ssh .
```

## Run

```
docker run git-ssh git --version
docker run git-ssh ssh -V
```
