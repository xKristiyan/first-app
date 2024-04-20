#!/bin/bash

set -e

# get project directory path
PROJ_DIR=$(dirname "${BASH_SOURCE[0]}")/..
PROJ_DIR=$(readlink -f "${PROJ_DIR}")
cd "${PROJ_DIR}"

# vivado environment
source "/data/Xilinx-Vivado/settings64.sh"

# prep & run
"${PROJ_DIR}/ci_scripts/run.sh"
