#!/usr/bin/env bash

##################################################################################################################
# Name         : run-gatling-scenario.sh
# Brief        : Script to kick off Gatling Tests via mvn
# Author       : Kamal Shingala
# Date         : 23rd, January, 2020
# Notes        : 23/01/2020 -- Created Version 1 of Script
##################################################################################################################

# Set Global Variables
PARENT_DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
PROJ_DIR="$PARENT_DIR/../../../../"

# Run Karate Test
echo "[INFO] Starting Gatling Scenario execution..."
cd "$PROJ_DIR"
mvn clean test-compile gatling:test
echo "[SUCCESS] Gatling test completed"