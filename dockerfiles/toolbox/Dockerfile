FROM alpine:3.11

RUN apk add --no-cache git git-crypt

RUN QBEC_VER=0.10.3 \
 && wget -O- https://github.com/splunk/qbec/releases/download/v${QBEC_VER}/qbec-linux-amd64.tar.gz \
     | tar -C /tmp -xzf - \
 && mv /tmp/qbec /tmp/jsonnet-qbec /usr/local/bin/

RUN KUBECTL_VER=1.17.0 \
 && wget -O /usr/local/bin/kubectl \
      https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VER}/bin/linux/amd64/kubectl \
 && chmod +x /usr/local/bin/kubectl

RUN HELM_VER=3.0.2 \
 && wget -O- https://get.helm.sh/helm-v${HELM_VER}-linux-amd64.tar.gz \
     | tar -C /tmp -zxf - \
 && mv /tmp/linux-amd64/helm /usr/local/bin/helm
