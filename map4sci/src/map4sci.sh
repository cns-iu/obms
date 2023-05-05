#!/bin/bash
source constants.sh
set -ev

CWL_FILE=https://raw.githubusercontent.com/cns-iu/map4sci/main/map4sci.cwl

if [ "$RUNNER" == "cwl" ]; then
  SCRIPT="./scripts/99x-run-all-datasets.sh"
  if [ -z $2 ]; then
    SCRIPT="$2"
  fi

  cwl-runner $CWL_OPTS $CWL_FILE \
    --dataset $1 --version $CURRENT_VERSION \
    --datasets_dir ./datasets --rawdata_dir ./raw-data --site_dir ./site \
    --script_cmd "cd /workspace/data-processor && ${SCRIPT}"
else
  docker compose -f src/docker-compose.yml run --rm \
    -e CURRENT_DATASET=$1 -e CURRENT_VERSION=${CURRENT_VERSION} map4sci $2
fi
