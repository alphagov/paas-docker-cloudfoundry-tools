FROM golang:1.5.3-alpine

ENV BUILD_PACKAGES "git"
ENV PACKAGES "jq"

ENV CONCOURSE_CODE_PATH ${GOPATH}/src/github.com/concourse/s3-resource

RUN apk add --update $PACKAGES $BUILD_PACKAGES

# Build the wrapped paas-s3 resource
RUN mkdir -p ${GOPATH}/src/github.com/concourse
RUN git clone https://github.com/alphagov/paas-s3-resource ${CONCOURSE_CODE_PATH} --branch gds --depth 10
RUN cd ${CONCOURSE_CODE_PATH} && \
    go get -v -d ./...
RUN cd ${CONCOURSE_CODE_PATH} && \
    go build -o built-in ./cmd/in
RUN cd ${CONCOURSE_CODE_PATH} && \
    go build -o built-out ./cmd/out
RUN cd ${CONCOURSE_CODE_PATH} && \
    go build -o built-check ./cmd/check

RUN mkdir -p /opt/resource/wrapped/s3
RUN mv ${CONCOURSE_CODE_PATH}/built-in /opt/resource/wrapped/s3/in
RUN mv ${CONCOURSE_CODE_PATH}/built-out /opt/resource/wrapped/s3/out
RUN mv ${CONCOURSE_CODE_PATH}/built-check /opt/resource/wrapped/s3/check

# Build smuggler
RUN go get -v github.com/redfactorlabs/concourse-smuggler-resource/cmd/smuggler

# Add smuggler binary
RUN cp ${GOPATH}/bin/smuggler /opt/resource/smuggler
RUN ln /opt/resource/smuggler /opt/resource/check && \
    ln /opt/resource/smuggler /opt/resource/in && \
    ln /opt/resource/smuggler /opt/resource/out

# Add the config file for this resource
ADD ./smuggler.yml /opt/resource/

# Add shared code used in smuggler.yml
ADD ./*.sh /opt/resource/

# Remove build dependencies
RUN apk del ${BUILD_PACKAGES} && rm -rf /var/cache/apk/*

RUN rm -rf ${GOPATH} ${GOROOT} /usr/local/go
