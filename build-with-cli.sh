#!/bin/bash

##############################################################################
#
# Module: build-with-cli.sh
#
# Function:
#	This script sets variables and calls the common build.
#
# Usage:
#	build-with-cli.sh --help
#
# Copyright and License:
#	See accompanying LICENSE.md file
#
# Author:
#	Terry Moore, MCCI	June 2023
#
##############################################################################

set -e

# get the path to this file as the default for the build path.
PDIR=$(realpath "$(dirname "$0")")

# export the root name of this script for use by build-common.
PNAME=$(basename "$0")
export PNAME

# so the build directory shows up where this script lives, CD here.
cd "$PDIR"

# launch the common script and pass in the args.
. "${PDIR}/extra/tools-build-with-cli/build-with-cli-lib.sh"

function _setProject {
    #---- project settings -----
    readonly OPTOUTPUTNAME_DEFAULT=model4916
    readonly OPTARDUINO_SOURCE_DEFAULT=sketch/Mobile-mode/Model4916-MultiGas-Sensor/Model4916-MultiGas-Sensor.ino
    readonly OPTARDUINO_BOARD_DEFAULT=4916
    readonly OPTKEYFILE_DEFAULT="$INVOKEDIR/keys/project.pem"
    readonly OPTREGION_DEFAULT=in866
    readonly OPTNETWORK_DEFAULT=ttn
    readonly OPTSUBBAND_DEFAULT=default
    readonly OPTCLOCK_DEFAULT=32
    readonly OPTXSERIAL_DEFAULT=hw
}

# result is version as either x.y.z-N or x.y.z (if pre-release tag is -0)
_debug "Override _getversion"
function _getversion {
    sed -n \
        -e 's/^static const char sVersion\[] = "\(.*\)";$/\1/p' \
        "$1"
}

_doBuild "$@"
