#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Building from '$DIR'"

rm -rf $DIR/output
mkdir $DIR/output
cd $DIR/output
../prc-tools-2.3/configure --enable-languages=c,c++ --enable-targets=m68k-palmos,arm-palmos --disable-nls --with-palmdev-prefix=$DIR/palmSdk --host=i686-linux-gnu
make
sudo make install
sudo palmdev-prep
