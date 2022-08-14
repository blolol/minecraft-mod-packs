#!/usr/bin/env bash
#
# Creates an ICO file containing different sizes of the Perkpack icon for use with It's the
# Little Things (https://github.com/zlepper/itlt). See:
# https://github.com/zlepper/itlt/wiki/Customising-your-modpack's-branding#iconography
#
# This script uses `icotool` from Oskar Liljeblad's icotools package:
# https://www.nongnu.org/icoutils/

icotool --create --output=images/perkpack.ico images/perkpack-{16,32,48,64,128,256}.png
cp images/perkpack.ico config/itlt/icon.ico
