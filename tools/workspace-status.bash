#!/usr/bin/env bash

WORKSPACE=`pwd`

LIBS=(ign_utils ign_math ign_common)

for LIB in "${LIBS[@]}"
do
  cd $LIB
  VER=`git describe --tags --abbrev=0 | cut -d_ -f2`
  echo "STABLE_${LIB^^}_VER ${VER}"
  cd $WORKSPACE
done
