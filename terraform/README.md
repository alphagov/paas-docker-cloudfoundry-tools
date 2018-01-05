Orange: [![Build Status](https://travis-ci.org/orange-cloudfoundry/paas-docker-cloudfoundry-tools.svg)](https://travis-ci.org/orange-cloudfoundry/paas-docker-cloudfoundry-tools)
AlphaGov: [![Build Status](https://travis-ci.org/alphagov/paas-docker-cloudfoundry-tools.svg)](https://travis-ci.org/alphagov/paas-docker-cloudfoundry-tools)

# docker-terraform

This container allows you to run Terraform inside a Docker container with plugins already downloaded.

## How to run and build

- ```docker build -t terraform .```

## How to run it

```
docker run -ti terraform terraform
```
