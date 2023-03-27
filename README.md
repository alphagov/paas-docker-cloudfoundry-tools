
Orange: [![Build Status](https://travis-ci.org/orange-cloudfoundry/paas-docker-cloudfoundry-tools.svg)](https://travis-ci.org/orange-cloudfoundry/paas-docker-cloudfoundry-tools)
AlphaGov: not using Travis anymore

Orange specifics:
* [bosh-cli-v2-cf-cli](bosh-cli-v2-cf-cli)
* [k8s-tools](k8s-tools)
* [terraform](terraform) (overrides Alphagov)

--------------------

# PaaS Docker Cloud Foundry tools

Contains Dockerfiles to build docker images for Cloud Foundry tools and other tools we use regularly.

Each directory with a Dockerfile relates to a container and will have
repository of the same name in Docker Hub.

## How to add a new container

You can add a new container you only need to add these files:

- The `Dockerfile` and support files to build the image.
- A `README.md` file describing the container
- A workflow to allow building the container. Use one of the existing ones in '.github/workflows/image\_\*.yml' for reference.
- Optional: a `*_spec.rb` file to test the container.

> Note: The repository must be [added to Docker Hub manually](https://hub.docker.com/orgs/governmentpaas/repositories)

## Rake tasks

Tasks to build and tests the containers will be generated automatically:

- `rake build:bosh-init` builds the container under `./bosh-init`
- `rake build:all` builds all containers
- `rake spec:bosh-init` tests the container under `./bosh-init`
- `rake spec:all` tests all the containers

Travis will execute the tasks `build:all` and `spec:all`
