Container for running the self-update pipeline task which runs
the setup pipeline scipts.

This includes all the software for this task to run.

* `ruby` and `curl`: Included on `ruby:slim`
* `make`

## Build locally

```
$ cd self-update-pipelines
$ docker build -t self-update-pipelines .
```

## Run

```
docker run -i -t self-update-pipelines ruby -v
docker run -i -t self-update-pipelines curl --version
docker run -i -t self-update-pipelines bash --version
docker run -i -t self-update-pipelines make --version
```
