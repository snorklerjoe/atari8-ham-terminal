#!/bin/bash

DOS_ATR_URL=https://www.atariwiki.org/wiki/attach/OSS%20A%2B%202/OSS_OS-Aplus_v2.atr
DOS_ATR_FILE="OSS_OS-Aplus_v2.atr"
AUTORUN_NAME="autorun.sys"

# Download DOS image
[ -f "$DOS_ATR_FILE" ] || wget $DOS_ATR_URL
cp "$DOS_ATR_FILE" hamterm.atr
atasm main.m65 -o"hamterm.com"


# Place binary in the image as an autorun file
cp "$DOS_ATR_FILE" hamterm.atr
cp hamterm.com "$AUTORUN_NAME"
atr hamterm.atr rm startup.exc
atr hamterm.atr put hamterm.com
rm "$AUTORUN_NAME"
