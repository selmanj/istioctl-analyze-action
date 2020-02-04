#!/bin/sh -l
find $1 \
    -type f \
    -name \*.yaml \
    -print0 | xargs -0 istioctl analyze -A