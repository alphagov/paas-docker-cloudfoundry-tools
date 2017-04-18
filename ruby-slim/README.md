Container for running deployment scripts based on ruby.

It includes some other packages commonly used when deploying CF apps:

* `ruby` and `curl`: Included on `ruby-slim`
* `unzip`
* `git`

Based on the [wheezy](https://hub.docker.com/_/debian/) image.

## Build locally

```
$ cd ruby-slim
$ docker build -t ruby-slim .
```

## Run

```
docker run -i -t ruby-slim ruby -v
docker run -i -t ruby-slim curl --version
docker run -i -t ruby-slim unzip -v
docker run -i -t ruby-slim git --version
```
