FROM ruby:2.7-slim

# we use libc6 instead of libc6-compat as we do not use alpine base image
ENV PACKAGES "unzip curl openssl ca-certificates git libc6 bash jq gettext"

# we also use apt-get as we use an Ubuntu image, not an Alpine
RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get install -y --no-install-recommends ${PACKAGES} \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/bin

ENV YTT_VERSION "0.30.0"
ENV YTT_SUM 456e58c70aef5cd4946d29ed106c2b2acbb4d0d5e99129e526ecb4a859a36145
ENV YTT_FILENAME ytt-linux-amd64
ADD https://github.com/k14s/ytt/releases/download/v${YTT_VERSION}/${YTT_FILENAME} .
RUN echo "Computed sha256sum: $(sha256sum ${YTT_FILENAME})" \
    && echo "${YTT_SUM}  ${YTT_FILENAME}" | sha256sum -c - \
    && mv ${YTT_FILENAME} ytt


ENV CREDHUB_CLI_VERSION 2.8.0
ENV CREDHUB_CLI_SUM dcd4f05eaaea6f356d8ffcbf2692c465b272fcdf773266589f4bc4a891cbe4e4
ENV CREDHUB_CLI_FILENAME credhub-linux-${CREDHUB_CLI_VERSION}.tgz
ADD https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/${CREDHUB_CLI_VERSION}/${CREDHUB_CLI_FILENAME} .
RUN echo "Computed sha256sum: $(sha256sum ${CREDHUB_CLI_FILENAME})" \
    && echo "${CREDHUB_CLI_SUM}  ${CREDHUB_CLI_FILENAME}" | sha256sum -c - \
    && tar zxvf ${CREDHUB_CLI_FILENAME}

ENV KUSTOMIZE_VERSION 3.8.4
ENV KUSTOMIZE_SUM 194caffbdb59d8fc887488ba8fa3dce7b68ccf816737b57bde7338ca980f4912
ENV KUSTOMIZE_FILENAME kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz
ADD https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/v${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz .
RUN echo "Computed sha256sum: $(sha256sum ${KUSTOMIZE_FILENAME})" \
    && echo "${KUSTOMIZE_SUM}  ${KUSTOMIZE_FILENAME}" | sha256sum -c - \
    && tar zxvf ${KUSTOMIZE_FILENAME}

ENV KAPP_VERSION 0.34.0
ENV KAPP_SUM e170193c40ff5dff9f9274c25048de1f50e23c69e8406df274fbb416d5862d7f
ENV KAPP_FILENAME kapp-linux-amd64
ADD https://github.com/k14s/kapp/releases/download/v${KAPP_VERSION}/kapp-linux-amd64 .
RUN echo "Computed sha256sum: $(sha256sum ${KAPP_FILENAME})" \
    && echo "${KAPP_SUM}  ${KAPP_FILENAME}" | sha256sum -c - \
    && mv kapp-linux-amd64 kapp

ENV KUBECTL_VERSION 1.18.8
ENV KUBECTL_SUM a076f5eff0710de94d1eb77bee458ea43b8f4d9572bbb3a3aec1edf0dde0a3e7
ENV KUBECTL_FILENAME kubectl
ADD https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl .
RUN echo "Computed sha256sum: $(sha256sum ${KUBECTL_FILENAME})" \
    && echo "${KUBECTL_SUM}  ${KUBECTL_FILENAME}" | sha256sum -c -

ENV HELM_VERSION 3.3.3
ENV HELM_SUM 246d58b6b353e63ae8627415a7340089015e3eb542ff7b5ce124b0b1409369cc
ENV HELM_FILENAME helm-v${HELM_VERSION}-linux-amd64.tar.gz
ADD https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz .
RUN echo "Computed sha256sum: $(sha256sum ${HELM_FILENAME})" \
    && echo "${HELM_SUM}  ${HELM_FILENAME}" | sha256sum -c - \
    && tar zxvf ${HELM_FILENAME} \
    && mv linux-amd64/helm helm \
    && rm -rf linux-amd64

ENV KUTTL_VERSION 0.6.1
ENV KUTTL_PLUGIN_SUM b128a080f9a05399c4f459d9f1fc289a4508d745535199de5bc0e751ce9c4d57
ENV KUTTL_PLUGIN_FILENAME kubectl-kuttl_${KUTTL_VERSION}_linux_x86_64
ADD https://github.com/kudobuilder/kuttl/releases/download/v${KUTTL_VERSION}/${KUTTL_PLUGIN_FILENAME} .
RUN echo "Computed ${KUTTL_PLUGIN_FILENAME} sha256sum: $(sha256sum ${KUTTL_PLUGIN_FILENAME})" \
    && echo "${KUTTL_PLUGIN_SUM}  ${KUTTL_PLUGIN_FILENAME}" | sha256sum -c - \
    && mv ${KUTTL_PLUGIN_FILENAME} kubectl-kuttl \
    && ln -s kubectl-kuttl kuttl


WORKDIR /usr/local/bin
RUN rm *.tgz && rm *.gz && chown root:root * && chmod a+x *

RUN ls -l
WORKDIR /

#ENTRYPOINT /bin/bash
