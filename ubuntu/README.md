Provides Ubuntu. See the Dockerfile to check which version.

This is primarily here to mirror the version from dockerhub. The
purpose is to get that container onto GitHub Container Registry, to
workaround rate limits and make our production use a bit safer.

Additionally, installs some base crypto / net dependencies

## Build locally

```
$ cd ubuntu
$ docker build -t ubuntu .
```
