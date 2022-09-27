#!/bin/bash
source constants.sh
set -ev

for jsonNetwork in $(ls ./input-data/*.json)
do
  dataset=$(basename "${jsonNetwork%.*}")
  echo $jsonNetwork $dataset
  echo
  OUT=./datasets/${dataset}
  mkdir -p $OUT

  if [ ! -e $OUT/network.dot ]
  then    
    python3 src/json2dot.py ${jsonNetwork} $OUT/network.dot &> $OUT/convert.log.txt
  fi
  if [ ! -e $OUT/config.sh ]
  then
    cat src/config-template.sh | perl -pe "s/--DATASET--/${dataset}/g" > $OUT/config.sh
  fi
done
