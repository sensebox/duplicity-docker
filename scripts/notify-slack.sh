#!/bin/bash

set -uo pipefail
IFS=$'\n\t'

# source this script in your pre/post scripts and call like this
# notify_slack "[Duplicity Backup] The command \`$CMD_PREV\` on \`$HOSTNAME\` failed with exit code \`$CMD_ERR\`. Run started at $RUN_START"

notify_slack () {
  if [ -n "$SLACK_HOOK_URL" ]
  then
    escapedText=$(echo "$1" | sed 's/"/\"/g' | sed "s/'/\'/g")
    json="{\"text\": \"$escapedText\"}"

    curl -s -d "payload=$json" "$SLACK_HOOK_URL"
  fi
}

