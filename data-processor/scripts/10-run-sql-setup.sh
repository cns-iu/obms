#!/bin/bash
source constants.sh
set -ev

for sql in src/sql/setup/*.sql; then
    echo $(basename $sql)
    time psql -f $sql
fi

