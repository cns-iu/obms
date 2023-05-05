#!/bin/bash
source constants.sh
set -ev

NODES=./input-data/OBMS_v4_meshTopJour_tfidf_nodeList.csv.gz

for network in $(ls ./input-data/*_edgeList.csv.gz)
do
  dataset=$(basename "${network%_edgeList.csv.gz}")
  echo $network $dataset
  echo
  OUT=./datasets/${dataset}_BatchTree
  OUT2=./datasets/${dataset}_DELG
  OUT3=./datasets/${dataset}_CG
  mkdir -p $OUT $OUT2 $OUT3

  if [ ! -e $OUT/network.dot ]
  then
    python3 src/convert-network.py ${NODES} ${network} $OUT/network.dot &> $OUT/convert.log.txt
    cp $OUT/network.dot $OUT2/network.dot
    cp $OUT/network.dot $OUT3/network.dot
  fi
  if [ ! -e $OUT/config.sh ]
  then
    cat src/config-template.sh | perl -pe "s/--DATASET--/${dataset}/g" > $OUT/config.sh
    cat $OUT/config.sh | perl -pe 's/BatchTree/DELG/g' > $OUT2/config.sh
    cat $OUT/config.sh | perl -pe 's/BatchTree/CG/g' > $OUT3/config.sh
  fi
done
