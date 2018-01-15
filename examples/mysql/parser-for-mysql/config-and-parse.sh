#!/bin/bash

cd /work/src
rm -rf build
mkdir build
cd build
cmake ../ -DCMAKE_BUILD_TYPE=Debug -DFEATURE_SET=community -DBUILD_CONFIG=mysql_release -DENABLE_DTRACE=OFF -DWITH_BOOST=../dep-boost -DDOWNLOAD_BOOST=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DMYSQL_MAINTAINER_MODE=OFF
# MySQL generates some source files during compilation
cmake --build .
cp compile_commands.json ../
cd ..
cc-parse $@
