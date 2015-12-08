FROM alpine
ENV PATH $PATH:/usr/local/bin
ENV TERRAFORM_VER 0.6.8_fixed
ENV TERRAFORM_ZIP terraform_${TERRAFORM_VER}_linux_amd64.zip

RUN apk update && apk add openssl openssh    
RUN set -ex \
       && wget https://github.com/alphagov/terraform/releases/download/v${TERRAFORM_VER}/${TERRAFORM_ZIP} -O /tmp/${TERRAFORM_ZIP} \
       && unzip /tmp/${TERRAFORM_ZIP} -d /usr/local/bin \
       && rm /tmp/${TERRAFORM_ZIP}

