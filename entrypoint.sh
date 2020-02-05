#!/bin/bash
set +e
output=$(find $1 \
    -type f \
    -name \*.yaml \
    -print0 | xargs -0 istioctl analyze -A -d 2>&1)
success=$?
echo "$output"
set -e

if [[ $success -ne 0 ]]; then
    # TODO check if PR and only comment if it is
    comments_url=$(jq -r '.pull_request.comments_url' $GITHUB_EVENT_PATH)
    # Wrap output so it's easier to read in a PR.
    wrapped_output=$(echo "$output" | fold -w 80 -s)
    comment=$'istioctl analyze found problems:\n\n```\n'"${wrapped_output}"$'\n```\n'
    data=$(echo '{}' | jq --arg body "$comment" '.body = $body')
    curl -s -S \
        -H "Authorization: token $INPUT_REPOTOKEN" \
        --header "Content-Type application/json" \
        --data "$data" \
        "$comments_url" > /dev/null
fi

exit $success