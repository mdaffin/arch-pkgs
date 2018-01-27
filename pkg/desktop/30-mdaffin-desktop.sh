#!/bin/sh

export MOZ_USE_XINPUT2=1

xrdb -override <<EOF
! Enable the extended coloring options
rofi.color-enabled: true
!                  bg       border   separator
rofi.color-window: #1f1f1f, #c6c6c6, #c6c6c6
!                  bg       fg       bg-alt   hl-bg    hl-fg
rofi.color-normal: #1f1f1f, #828282, #1f1f1f, #1f1f1f, #c6c6c6
rofi.color-active: #1f1f1f, #828282, #1f1f1f, #1f1f1f, #c6c6c6
rofi.color-urgent: #1f1f1f, #828282, #1f1f1f, #1f1f1f, #c6c6c6

rofi.separator-style: solid
rofi.sidebar-mode: false
rofi.lines: 5
rofi.font: monofur 22
rofi.bw: 1
rofi.columns: 2
rofi.padding: 5
rofi.fixed-num-lines: true
rofi.hide-scrollbar: true
EOF
