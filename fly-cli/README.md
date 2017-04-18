Container for running Concourse fly client.

It includes the tooling required to update the upstream pipelines

* `fly` concourse CLI
* `curl`
* `ruby` and `bash`

## Build locally

```
$ cd fly-cli
$ docker build -t fly-cly .
```

## Run

```
docker run -i -t fly-cli fly --help
```
