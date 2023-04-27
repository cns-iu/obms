#!/bin/bash
source constants.sh
set -ev
for sql in src/sql/export/*.sql; do
    echo $(basename $sql)
    time psql -f $sql
done
