#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

if [[ ! -e /confd-has-run ]]; then
  mkdir -p /etc/duply/prod-backup
  chmod -R 0700 /etc/duply
  confd -onetime -backend env
  touch /confd-has-run
fi

duply prod-backup $DUPLY_ACTION
