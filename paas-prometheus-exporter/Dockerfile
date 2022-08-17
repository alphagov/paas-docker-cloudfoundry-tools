FROM golang:1.14 AS build

ENV COMMIT_SHA c02e5624a2098d7b4593ab2da56ad6f4cfbf8d24
ENV REPO_URL https://github.com/alphagov/paas-prometheus-exporter.git
ENV REPO_PATH /go/src/github.com/alphagov/paas-prometheus-exporter

RUN mkdir -p $REPO_PATH
WORKDIR $REPO_PATH

RUN git clone $REPO_URL . && \
  git checkout $COMMIT_SHA

RUN CGO_ENABLED=0 GOOS=linux go install

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN grep 'version[^=]*=.*"[^"]*"' $REPO_PATH/main.go \
  | grep -o '"[^"]*"' | tr -d '"' > /tmp/version

FROM ghcr.io/alphagov/paas/alpine:main AS run

COPY --from=build /tmp/version /opt/paas-prometheus-exporter.version

COPY --from=build \
  /go/bin/paas-prometheus-exporter \
  /usr/bin/paas-prometheus-exporter

RUN chmod +x /usr/bin/paas-prometheus-exporter
