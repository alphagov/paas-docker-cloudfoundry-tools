FROM alpine:3.12

ENV PATH $PATH:/usr/local/bin
ENV TERRAFORM_SHARED_DIR /.terraform/plugins/linux_amd64
ENV TERRAFORM_VER 0.11.14
ENV TERRAFORM_SUM 9b9a4492738c69077b079e595f5b2a9ef1bc4e8fb5596610f69a6f322a8af8dd
ENV TERRAFORM_ZIP terraform_${TERRAFORM_VER}_linux_amd64.zip

ENV PROVIDER_CLOUDFOUNDRY_VERSION 0.11.2
ENV PROVIDER_CLOUDFOUNDRY_SUM cad949683898195c44864e290fa0d0d9207eb75fdacaf94544e1c77ecb9f5246

ENV PROVIDER_CREDHUB_VERSION 0.13.0
ENV PROVIDER_CREDHUB_SUM 5c75dc1779c47c93399cf55abd86184719f3bcfecffa0fb6330a359b9f407541

ENV PROVIDER_UAA_VERSION 0.9.0
ENV PROVIDER_UAA_SUM bfbab04dde59e70354c98f4516924c447d70c3bb3a5689dd4d6466e744162220

RUN mkdir -p ${TERRAFORM_SHARED_DIR}


RUN apk add --no-cache openssl openssh-client ca-certificates wget libc6-compat


RUN set -ex \
    && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/${TERRAFORM_ZIP} -O /tmp/${TERRAFORM_ZIP} \
    && echo "Computed sha256sum: $(sha256sum /tmp/${TERRAFORM_ZIP})" \
    && echo "${TERRAFORM_SUM}  /tmp/${TERRAFORM_ZIP}" | sha256sum -c - \
    && unzip /tmp/${TERRAFORM_ZIP} -d /usr/local/bin \
    && rm /tmp/${TERRAFORM_ZIP}


# Terraform CF provider name is not version dependant
RUN set -ex \
    && export FILENAME="terraform-provider-cloudfoundry" \
    && export FILENAME_SUFFIX="_0.11_linux_amd64" \
    && export FULL_FILENAME="$FILENAME$FILENAME_SUFFIX" \
    && export URL="https://github.com/orange-cloudfoundry/terraform-provider-cloudfoundry/releases/download/v${PROVIDER_CLOUDFOUNDRY_VERSION}/${FULL_FILENAME}" \
    && export SUM=${PROVIDER_CLOUDFOUNDRY_SUM} \
    && wget ${URL} -O /tmp/${FULL_FILENAME} \
    && echo "Computed sha256sum: $(sha256sum /tmp/${FULL_FILENAME})" \
    && echo "${SUM}  /tmp/${FULL_FILENAME}" | sha256sum -c - \
    && mv /tmp/${FULL_FILENAME} ${TERRAFORM_SHARED_DIR}/${FILENAME}_v${PROVIDER_CLOUDFOUNDRY_VERSION} \
    && chmod +x ${TERRAFORM_SHARED_DIR}/*

# Terraform Credhub provider name is not version dependant
RUN set -ex \
    && export FILENAME="terraform-provider-credhub" \
    && export FILENAME_SUFFIX="_linux_amd64" \
    && export FULL_FILENAME="$FILENAME$FILENAME_SUFFIX" \
    && export URL="https://github.com/orange-cloudfoundry/terraform-provider-credhub/releases/download/v${PROVIDER_CREDHUB_VERSION}/${FULL_FILENAME}" \
    && export SUM=${PROVIDER_CREDHUB_SUM} \
    && wget ${URL} -O /tmp/${FULL_FILENAME} \
    && echo "Computed sha256sum: $(sha256sum /tmp/${FULL_FILENAME})" \
    && echo "${SUM}  /tmp/${FULL_FILENAME}" | sha256sum -c - \
    && mv /tmp/${FULL_FILENAME} ${TERRAFORM_SHARED_DIR}/${FILENAME}_v${PROVIDER_CREDHUB_VERSION} \
    && chmod +x ${TERRAFORM_SHARED_DIR}/* \
    && echo "Computed sha256sum: $(sha256sum ${TERRAFORM_SHARED_DIR}/${FILENAME}_v${PROVIDER_CREDHUB_VERSION})"

# Terraform UAA provider name is not version dependant
RUN set -ex \
    && export FILENAME="terraform-provider-uaa" \
    && export FILENAME_SUFFIX="_linux_amd64" \
    && export FULL_FILENAME="$FILENAME$FILENAME_SUFFIX" \
    && export ATTIC_FULL_FILENAME="${FILENAME}_${PROVIDER_UAA_VERSION}${FILENAME_SUFFIX}.0" \
    && export URL="https://github.com/orange-cloudfoundry/terraform-provider-attic/releases/download/uaa_${PROVIDER_UAA_VERSION}/$ATTIC_FULL_FILENAME" \
    && export SUM=${PROVIDER_UAA_SUM} \
    && wget ${URL} -O /tmp/${FULL_FILENAME} \
    && echo "Computed sha256sum: $(sha256sum /tmp/${FULL_FILENAME})" \
    && echo "${SUM}  /tmp/${FULL_FILENAME}" | sha256sum -c - \
    && mv /tmp/${FULL_FILENAME} ${TERRAFORM_SHARED_DIR}/${FILENAME}_v${PROVIDER_UAA_VERSION} \
    && chmod +x ${TERRAFORM_SHARED_DIR}/*

ENV TF_DATA_DIR "/.terraform"
COPY plugin_cache.tf /tmp/
RUN cd /tmp && terraform init

ENV TF_INPUT 0
