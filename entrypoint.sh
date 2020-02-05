#!/bin/bash
set +e
output=$(find $1 \
    -type f \
    -name \*.yaml \
    -print0 | xargs -0 istioctl analyze -A -d)
success=$?
echo $output
set -e

if [[ $success -ne 0 ]]; then
    # TODO check if PR and only comment if it is
    comments_url=$(jq '.pull_request.comments_url' $GITHUB_EVENT_PATH)
    # TODO actually implement this
    echo "Comments url: $comments_url"
fi