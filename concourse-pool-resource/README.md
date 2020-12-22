Provides the Concourse Pool Resource. See the Dockerfile to check
which version.

For now this container is merely a mirror of DockerHub's
`concourse/pool-resource`. The purpose is to get that container onto
GitHub Container Registry, to workaround rate limits and make our
production use a bit safer.

## Build locally

```
$ cd concourse-pool-resource
$ docker build -t concourse-pool-resource .
```
