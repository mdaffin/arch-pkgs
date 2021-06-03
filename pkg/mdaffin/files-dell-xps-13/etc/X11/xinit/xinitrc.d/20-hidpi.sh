#!/bin/sh

echo 'Xft.dpi: 192' | xrdb -override
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
