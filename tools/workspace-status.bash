#!/usr/bin/env bash

WORKSPACE=`pwd`

LIBS=(
  ign_common 
  ign_fuel_tools 
  ign_math 
  ign_msgs 
  ign_physics
  ign_plugin
  ign_rendering
  ign_transport
  ign_utils 
  sdformat)

for LIB in "${LIBS[@]}"
do
  cd $LIB
  VER=`git describe --tags --abbrev=0 | cut -d_ -f2`
  echo "STABLE_${LIB^^}_VER ${VER}"
  cd $WORKSPACE
done
