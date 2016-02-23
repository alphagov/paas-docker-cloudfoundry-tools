[![Build Status](https://travis-ci.org/alphagov/paas-docker-terraform.svg)](https://travis-ci.org/alphagov/paas-docker-terraform)
# docker-terraform

This container allows you to run Terraform inside a Docker container.

## How to run and build

- ```docker build -t terraform .```

## How to run it

```
docker run -ti terraform terraform
```

## Container size and binary whitelist

The Terraform installation is quite large; 30~ provider and provisioner
binaries at 10~20M each. In order to reduce the size of the final container
we only install the providers and provisioners that we expect to use. A list
of these is maintained in the [Dockerfile](Dockerfile). We don't expect to
need to do this in the future if [hashicorp/terraform#4233][] is solved.

[hashicorp/terraform#4233]: https://github.com/hashicorp/terraform/issues/4233
