#!/bin/bash
source constants.sh
set -ev

for sql in src/sql/setup/*.sql; do
    echo $(basename $sql)
    time psql -f $sql
done
