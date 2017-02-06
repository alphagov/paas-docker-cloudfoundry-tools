Includes AWS client tools (`awscli`) to interact with the AWS platform via
command line.

Also curl with SSL and openssl support is included, to allow scripting HTTP
calls if necessary (e.g. query metadata)

## Build locally

```
$ cd awscli
$ docker build -t awscli.
```

## Run

```
docker run -i -t awscli aws help
```
