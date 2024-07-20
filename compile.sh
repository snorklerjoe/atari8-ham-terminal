#!/bin/bash

cd "$(dirname "$0")"

DOS_ATR_URL=https://www.atariwiki.org/wiki/attach/OSS%20A%2B%202/OSS_OS-Aplus_v2.atr
DOS_ATR_FILE="OSS_OS-Aplus_v2.atr"
AUTORUN_NAME="autorun.sys"

# Download DOS image
[ -f "$DOS_ATR_FILE" ] || wget $DOS_ATR_URL
cp "$DOS_ATR_FILE" hamterm.atr

cd src
atasm -ha../a8hamtermeq.m65  ./main.m65 -o"../hamterm.com"
cd ..

# Place binary in the image as an autorun file
cp "$DOS_ATR_FILE" hamterm.atr
cp hamterm.com "$AUTORUN_NAME"
atr hamterm.atr rm startup.exc
atr hamterm.atr put hamterm.com
atr hamterm.atr put startup.exc
rm "$AUTORUN_NAME"
