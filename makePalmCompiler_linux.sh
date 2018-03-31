#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Building from '$DIR'"

# prc-tools
rm -rf $DIR/output
mkdir $DIR/output
cd $DIR/output
../prc-tools-2.3/configure --enable-languages=c,c++ --enable-targets=m68k-palmos,arm-palmos --disable-nls --with-palmdev-prefix=$DIR/palmSdk --host=i686-linux-gnu
make
sudo make install
sudo palmdev-prep

# pilrc
rm -rf $DIR/pilrc_out
mkdir $DIR/pilrc_out
cd $DIR/pilrc_out
../pilrc/unix/configure
make
sudo cp ./pilrc /usr/local/bin
