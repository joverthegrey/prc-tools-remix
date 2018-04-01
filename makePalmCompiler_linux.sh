#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Building from '$DIR'"

# prc-tools
rm -rf $DIR/output
mkdir $DIR/output
cd $DIR/output
../prc-tools-2.3/configure --enable-languages=c,c++ --enable-targets=m68k-palmos,arm-palmos --disable-nls --disable-doc --with-palmdev-prefix=$DIR/palmSdk --host=i686-linux-gnu
make
sudo make install
sudo palmdev-prep
sudo palmdev-prep --default 3.5

# pilrc
rm -rf $DIR/pilrc_out
mkdir $DIR/pilrc_out
cd $DIR/pilrc_out
../pilrc/unix/configure
make
sudo cp ./pilrc /usr/local/bin

# pilot-xfer
rm -rf $DIR/pilot-link_out
mkdir $DIR/pilot-link_out
cd $DIR/pilot-link_out
../pilot-link-0.12.0-pre2/configure --with-libpng
make
sudo cp ./src/pilot-xfer /usr/local/bin
sudo mkdir -p /usr/local/bin/.libs
sudo cp -a ./src/.libs/. /usr/local/bin/.libs
sudo cp ./libpisock/.libs/libpisock.9.0.0.so /usr/local/lib
sudo cp ./libpisock/.libs/libpisock.9.so /usr/local/lib
sudo cp ./libpisock/.libs/libpisock.so /usr/local/lib
