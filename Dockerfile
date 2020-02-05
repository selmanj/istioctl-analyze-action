FROM istio/istioctl:1.5.0-alpha.0

# Istio base iamges nuke this directory
RUN mkdir -p /var/lib/apt/lists/partial
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
      jq

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]