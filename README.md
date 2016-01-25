[![Build Status](https://travis-ci.org/alphagov/paas-docker-terraform.svg)](https://travis-ci.org/alphagov/paas-docker-terraform)
# docker-terraform

This container allows you to run Terraform inside a Docker container. You
need to export your credentials as environment variables. For AWS it needs
```TF_VAR_AWS_ACCESS_KEY_ID``` and ```TF_VAR_AWS_SECRET_ACCESS_KEY```

## How to run and build

- ```docker build -t terraform .```

## How to run it

```
docker run -ti \
        -e TF_VAR_AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
        -e TF_VAR_AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
        terraform
```
