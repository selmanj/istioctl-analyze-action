FROM ubuntu:18.04

USER root
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
      jq curl ca-certificates

# Istioctl master built feb 14th
RUN curl -Ls https://storage.googleapis.com/istio-build/dev/1.6-alpha.10ba91244e262700c85df779354eca42f5c2bc4e/istioctl-1.6-alpha.10ba91244e262700c85df779354eca42f5c2bc4e-linux.tar.gz -o istioctl.tar.gz \
    && mkdir /istioctl && tar -zxf istioctl.tar.gz -C /istioctl && rm istioctl.tar.gz

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]