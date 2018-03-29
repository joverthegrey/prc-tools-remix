#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Building from '$DIR'"

rm -rf $DIR/output
mkdir $DIR/output
cd $DIR/output
../prc-tools-remix/prc-tools-2.3/configure --enable-languages=c,c++ --enable-targets=m68k-palmos,arm-palmos --with-palmdev-prefix=../palmSdk/sdk-5r4 --host=i686-linux-gnu
make
