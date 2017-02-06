Installs Git with OpenSSH

Git also includes by default curl, OpenSSL and ca-certificates.

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
