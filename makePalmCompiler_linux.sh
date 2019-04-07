#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Building from '$DIR'"

# prc-tools
rm -rf $DIR/output
mkdir -p $DIR/output || exit
cd $DIR/output
../prc-tools-2.3/configure --enable-languages=c,c++ --enable-targets=m68k-palmos,arm-palmos --disable-nls --disable-doc --with-palmdev-prefix=$DIR/palmSdk --host=i686-linux-gnu || exit
make || exit
sudo make install || exit
sudo palmdev-prep || exit
sudo palmdev-prep --default 3.5 || exit

# pilrc
rm -rf $DIR/pilrc_out
mkdir -p $DIR/pilrc_out || exit
cd $DIR/pilrc_out
../pilrc/unix/configure || exit
make || exit
sudo cp ./pilrc /usr/local/bin || exit

# pilot-xfer
rm -rf $DIR/pilot-link_out
mkdir -p $DIR/pilot-link_out || exit
cd $DIR/pilot-link_out
../pilot-link-0.12.0-pre2/configure --with-libpng || exit
make || exit
sudo cp ./src/pilot-xfer /usr/local/bin || exit
sudo mkdir -p /usr/local/bin/.libs || exit
sudo cp -a ./src/.libs/. /usr/local/bin/.libs || exit
sudo cp ./libpisock/.libs/libpisock.so.9.0.0 /usr/local/lib || exit
sudo cp ./libpisock/.libs/libpisock.so.9 /usr/local/lib || exit
sudo cp ./libpisock/.libs/libpisock.so /usr/local/lib || exit
