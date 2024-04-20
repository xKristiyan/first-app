#!/bin/bash

set -e

# get project directory path
PROJ_DIR=$(dirname "${BASH_SOURCE[0]}")/..
PROJ_DIR=$(readlink -f "${PROJ_DIR}")

# get environment variables
source "${PROJ_DIR}/ci_scripts/vars.sh"

# clean simulation directory
set +e
rm -rf "${PROJ_DIR}/sim"
set -e
mkdir "${PROJ_DIR}/sim"
cd "${PROJ_DIR}/sim"

# export simulation
# https://www.xilinx.com/support/documentation/sw_manuals/xilinx2013_4/ug835-vivado-tcl-commands.pdf
TMPFILE="${PROJ_DIR}/sim/vivado_proj_export.tcl"
cat << EOF > ${TMPFILE}
  open_project ${PROJ_DIR}/${CI_PROJECT}.xpr
  export_simulation -export_source_files -force -directory ${PROJ_DIR}/sim -simulator xsim
EOF

vivado -mode batch -source ${TMPFILE}

# fix simulation environment
ln -s "${PROJ_DIR}/sim/xsim/srcs" "${PROJ_DIR}/sim/xsim/srcs/srcs"


