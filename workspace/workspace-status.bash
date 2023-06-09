#!/usr/bin/env bash

WORKSPACE=`pwd`

LIBS=(
  common
  fuel_tools
  gui
  math
  msgs
  physics
  plugin
  rendering
  sensors
  transport
  utils
  sdformat)

for LIB in "${LIBS[@]}"
do
  if [ -d "$LIB" ]; then
    cd $LIB
    VER=`git describe --tags --abbrev=0 | cut -d_ -f2`
    echo "STABLE_${LIB^^}_VER ${VER}"
    cd $WORKSPACE
  fi
done
