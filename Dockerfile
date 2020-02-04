FROM istio/istioctl:1.5.0-alpha.0

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]