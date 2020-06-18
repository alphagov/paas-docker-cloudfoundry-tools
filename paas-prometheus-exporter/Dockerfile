FROM golang:1.14

ENV COMMIT_SHA c02e5624a2098d7b4593ab2da56ad6f4cfbf8d24

WORKDIR /tmp

RUN mkdir -p /go/src/github.com/alphagov/paas-prometheus-exporter && \
    cd /go/src/github.com/alphagov/paas-prometheus-exporter && \
    git clone https://github.com/alphagov/paas-prometheus-exporter.git . && \
    git checkout $COMMIT_SHA && \
    go build && \
    go install
