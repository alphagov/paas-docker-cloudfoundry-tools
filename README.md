[![Build Status](https://travis-ci.org/alphagov/paas-docker-cloudfoundry-tools.svg)](https://travis-ci.org/alphagov/paas-docker-cloudfoundry-tools)

Contains Dockerfiles to build the Cloud foundry tools.

Each directory with a Dockerfile relates to a container and will have
repository of the same name in Docker Hub.

# How to add a new container

You can add a new container you only need to add these files:

 * the `Dockerfile` and support files to build the image.
 * a symlink to the [hooks directory](hooks/).
 * a `README.md` file describing the container. Its content will populate the
   docker repository description.
 * one or more `*_spec.rb` files to test the container.

> Note: The automated build in dockerhub or similar must be setup manually.

## Rake tasks

Tasks to build and tests the containers will be generated automatically:

 * `rake build:bosh-init` builds the container under `./bosh-init`
 * `rake build:all` builds all containers
 * `rake spec:bosh-init` tests the container under `./bosh-init`
 * `rake spec:all` tests all the containers

Travis will execute the tasks `build:all` and `spec:all`
