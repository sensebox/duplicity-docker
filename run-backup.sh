#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

if [[ ! -e /confd-has-run ]]; then
  mkdir -p /root/.duply/prod-backup
  chmod -R 0700 /root/.duply
  confd -onetime -backend env
  touch /confd-has-run
fi

duply prod-backup $DUPLY_ACTION
