# K8S Tools

This image is for building containers for accessing k8s

## Build locally

```
$ cd k8s-tools
$ docker build -t k8s-tools .
```

## Run

```
docker run -i -t k8s-tools ytt --version
```