FROM hashicorp/terraform:0.12.2 as terraform
FROM alpine:3.9

COPY --from=terraform /bin/terraform /usr/bin

RUN apk add --update \
    bash \
    ca-certificates \
    curl \
    git \
    jq \
    openssh-client \
    openssl \
    perl-utils \
    py3-pip \
    py3-setuptools \
    && \
    apk --update add --virtual .build-deps \
    build-base \
    gcc \
    libffi-dev \
    openssl-dev \
    python3-dev \
    && \
    pip3 install --upgrade --no-cache-dir \
    awscli==1.16.116 \
    ansible==2.8.0 \
    yq==2.7.2 \
    && \
    apk del .build-deps \
    && \
    rm -rf /var/cache/apk/* \
    && \
    curl -L -o /usr/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v1.13.4/bin/linux/amd64/kubectl \
    && \
    chmod +x /usr/bin/kubectl \
    && \
    curl -L -o /usr/bin/aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/aws-iam-authenticator \
    && \
    chmod +x /usr/bin/aws-iam-authenticator \
    && \
    curl -L -o /tmp/helm.tar.gz https://storage.googleapis.com/kubernetes-helm/helm-v2.12.2-linux-amd64.tar.gz \
    && \
    mkdir /tmp/helm \
    && \
    tar -xz -C /tmp/helm -f /tmp/helm.tar.gz \
    && \
    mv /tmp/helm/linux-amd64/helm /tmp/helm/linux-amd64/tiller /usr/local/bin \
    && \
    curl -L -o /usr/bin/svcat https://download.svcat.sh/cli/v0.2.0/linux/amd64/svcat \
    && \
    chmod +x /usr/bin/svcat


CMD ["/bin/bash"]
