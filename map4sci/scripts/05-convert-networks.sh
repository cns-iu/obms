#!/bin/bash
source constants.sh
set -ev

for network in $(ls ./input-data/*_edgeList.csv.gz)
do
  dataset=$(basename "${network%_edgeList.csv.gz}")
  echo $network $dataset
  echo
  OUT=./datasets/${dataset}_BatchTree
  OUT2=./datasets/${dataset}_DELG
  # OUT3=./datasets/${dataset}_CG
  mkdir -p $OUT $OUT2 # $OUT3

  V=$(echo $network | cut -d '_' -f 2)
  if [ "${V}" == "v4.1" ]; then
    NODES=./input-data/OBMS_v4.1_filtered_tfidf_nodeList.csv.gz
  elif [ "${V}" == "v3" ]; then
    NODES=./input-data/OBMS_v3_allJallM_tfidf_nodeList.csv.gz
  fi

  if [ ! -e $OUT/network.dot ]
  then
    python3 src/convert-network.py ${NODES} ${network} $OUT/network.dot &> $OUT/convert.log.txt
    cp $OUT/network.dot $OUT2/network.dot
    # cp $OUT/network.dot $OUT3/network.dot
  fi
  if [ ! -e $OUT/config.sh ]
  then
    cat src/config-template.sh | perl -pe "s/--DATASET--/${dataset}_BatchTree/g" > $OUT/config.sh
    cat src/config-template.sh | perl -pe "s/--DATASET--/${dataset}_DELG/g;s/BatchTree/DELG/g" > $OUT2/config.sh
    # cat src/config-template.sh | perl -pe "s/--DATASET--/${dataset}_CG/g;s/BatchTree/CG/g" > $OUT3/config.sh
  fi
done
