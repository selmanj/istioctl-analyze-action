FROM istio/istioctl:1.5.0-alpha.0

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
      jq

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]