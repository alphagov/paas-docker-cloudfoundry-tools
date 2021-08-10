FROM ruby:2.7-slim

# we use libc6 instead of libc6-compat as we do not use alpine base image
ENV PACKAGES "unzip curl openssl ca-certificates git libc6 bash jq gettext"

# we also use apt-get as we use an Ubuntu image, not an Alpine
RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get install -y --no-install-recommends ${PACKAGES} \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/bin

ENV YTT_VERSION "0.35.1"
ENV YTT_SUM 0aa78f7b5f5a0a4c39bddfed915172880344270809c26b9844e9d0cbf6437030
ENV YTT_FILENAME ytt-linux-amd64
ADD https://github.com/k14s/ytt/releases/download/v${YTT_VERSION}/${YTT_FILENAME} .
RUN echo "Computed sha256sum: $(sha256sum ${YTT_FILENAME})" \
    && echo "${YTT_SUM}  ${YTT_FILENAME}" | sha256sum -c - \
    && mv ${YTT_FILENAME} ytt


ENV CREDHUB_CLI_VERSION 2.9.0
ENV CREDHUB_CLI_SUM f260e926099f9eb9474ab2239851e391bfd0fd1354a52891f3c834cea1630e8a
ENV CREDHUB_CLI_FILENAME credhub-linux-${CREDHUB_CLI_VERSION}.tgz
ADD https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/${CREDHUB_CLI_VERSION}/${CREDHUB_CLI_FILENAME} .
RUN echo "Computed sha256sum: $(sha256sum ${CREDHUB_CLI_FILENAME})" \
    && echo "${CREDHUB_CLI_SUM}  ${CREDHUB_CLI_FILENAME}" | sha256sum -c - \
    && tar zxvf ${CREDHUB_CLI_FILENAME}

ENV KUSTOMIZE_VERSION 4.2.0
ENV KUSTOMIZE_SUM 220dd03dcda8e45dc50e4e42b2d71882cbc4c05e0ed863513e67930ecad939eb
ENV KUSTOMIZE_FILENAME kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz
ADD https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/v${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz .
RUN echo "Computed sha256sum: $(sha256sum ${KUSTOMIZE_FILENAME})" \
    && echo "${KUSTOMIZE_SUM}  ${KUSTOMIZE_FILENAME}" | sha256sum -c - \
    && tar zxvf ${KUSTOMIZE_FILENAME}

ENV KAPP_VERSION 0.37.0
ENV KAPP_SUM f845233deb6c87feac7c82d9b3f5e03ced9a4672abb1a14d4e5b74fe53bc4538
ENV KAPP_FILENAME kapp-linux-amd64
ADD https://github.com/k14s/kapp/releases/download/v${KAPP_VERSION}/kapp-linux-amd64 .
RUN echo "Computed sha256sum: $(sha256sum ${KAPP_FILENAME})" \
    && echo "${KAPP_SUM}  ${KAPP_FILENAME}" | sha256sum -c - \
    && mv kapp-linux-amd64 kapp

ENV KUBECTL_VERSION 1.20.9
ENV KUBECTL_SUM 9d76c4431e10e268dd7c6b53b27aaa62a6f26455013e1d7f6d85da86003539b9
ENV KUBECTL_FILENAME kubectl
ADD https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl .
ADD https://storage.googleapis.com/kubernetes-release/release/v1.20.9/bin/linux/amd64/kubectl .
RUN echo "Computed sha256sum: $(sha256sum ${KUBECTL_FILENAME})" \
    && echo "${KUBECTL_SUM}  ${KUBECTL_FILENAME}" | sha256sum -c -

ENV HELM_VERSION 3.6.3
ENV HELM_SUM 07c100849925623dc1913209cd1a30f0a9b80a5b4d6ff2153c609d11b043e262
ENV HELM_FILENAME helm-v${HELM_VERSION}-linux-amd64.tar.gz
ADD https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz .
RUN echo "Computed sha256sum: $(sha256sum ${HELM_FILENAME})" \
    && echo "${HELM_SUM}  ${HELM_FILENAME}" | sha256sum -c - \
    && tar zxvf ${HELM_FILENAME} \
    && mv linux-amd64/helm helm \
    && rm -rf linux-amd64

ENV KUTTL_VERSION 0.11.0
ENV KUTTL_PLUGIN_SUM ce481fed5af651893c431e8182d0a6a0350882c3ca4fa62e5ce0e3de876e9267
ENV KUTTL_PLUGIN_FILENAME kubectl-kuttl_${KUTTL_VERSION}_linux_x86_64
ADD https://github.com/kudobuilder/kuttl/releases/download/v${KUTTL_VERSION}/${KUTTL_PLUGIN_FILENAME} .
RUN echo "Computed ${KUTTL_PLUGIN_FILENAME} sha256sum: $(sha256sum ${KUTTL_PLUGIN_FILENAME})" \
    && echo "${KUTTL_PLUGIN_SUM}  ${KUTTL_PLUGIN_FILENAME}" | sha256sum -c - \
    && mv ${KUTTL_PLUGIN_FILENAME} kubectl-kuttl \
    && ln -s kubectl-kuttl kuttl

ENV YQ_VERSION 4.9.6
ENV YQ_SUM a1cfa39a9538e27f11066aa5659b32f9beae1eea93369d395bf45bcfc8a181dc
ENV YQ_FILENAME yq_linux_amd64
ADD https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/${YQ_FILENAME} .
RUN echo "${YQ_SUM}  ${YQ_FILENAME}" | sha256sum -c - \
    && chmod +x ${YQ_FILENAME} \
    && mv ${YQ_FILENAME} /usr/local/bin/yq

ENV BOSH_CLI_VERSION 6.4.4
ENV BOSH_CLI_SUM c944dd694e5470686995c2365ac60c9ef06f655cab51994f7fefed4c89e764fb
ENV BOSH_CLI_FILENAME bosh-cli-${BOSH_CLI_VERSION}-linux-amd64
ADD https://s3.amazonaws.com/bosh-cli-artifacts/${BOSH_CLI_FILENAME} .
RUN echo "${BOSH_CLI_SUM}  ${BOSH_CLI_FILENAME}" | sha256sum -c - \
      && chmod +x ${BOSH_CLI_FILENAME} \
      && mv ${BOSH_CLI_FILENAME} /usr/local/bin/bosh

WORKDIR /usr/local/bin
RUN rm *.tgz && rm *.gz && chown root:root * && chmod a+x *

RUN ls -l
WORKDIR /

#ENTRYPOINT /bin/bash
