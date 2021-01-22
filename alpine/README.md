Provides Alpine Linux. See the Dockerfile to check which version.

For now this container is merely a mirror of DockerHub's `alpine`. The
purpose is to get that container onto GitHub Container Registry, to
workaround rate limits and make our production use a bit safer.

## Build locally

```
$ cd alpine
$ docker build -t alpine .
```
