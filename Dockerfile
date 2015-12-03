FROM ubuntu:latest
ENV PATH $PATH:/usr/local/bin
ENV TERRAFORM_VER 0.6.8
ENV TERRAFORM_ZIP terraform_${TERRAFORM_VER}_linux_amd64.zip

RUN apt-get update && apt-get -y install wget unzip openssh-client ruby
RUN set -ex \
       && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/${TERRAFORM_ZIP} -O /tmp/terraform_${TERRAFORM_ZIP} \
       && unzip /tmp/terraform_${TERRAFORM_ZIP} -d /usr/local/bin \
       && chmod 775 /usr/local/bin/terra* \
       && rm /tmp/terraform_${TERRAFORM_ZIP}

