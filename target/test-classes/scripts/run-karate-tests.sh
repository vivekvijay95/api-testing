#!/usr/bin/env bash

##################################################################################################################
# Name         : run-karate-tests.sh
# Brief        : Script to kick off Karate Tests via mvn
# Author       : Kamal Shingala
# Date         : 23rd, January, 2020
# Notes        : 23/01/2020 -- Created Version 1 of Script
##################################################################################################################

# Set Global Variables
PARENT_DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
PROJ_DIR="$PARENT_DIR/../../../../"

# Run Karate Test
echo "[INFO] Starting Karate Tests execution..."
cd "$PROJ_DIR"
mvn clean test -Dkarate.options="--tags $KARATE_TAGS" -Dtest=TestRunner
echo "[SUCCESS] Karate test run completed"