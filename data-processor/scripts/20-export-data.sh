#!/bin/bash
source constants.sh
set -ev

time psql -f src/sql/data_extraction.sql
