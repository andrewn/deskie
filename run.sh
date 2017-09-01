#!/bin/bash

# Make sure i2c is loaded
modprobe i2c-dev

# Start the fuse driver
systemctl start epd-fuse.service

# Take a screenshot
chromium --headless --disable-gpu --screenshot --window-size=169,264 https://s.codepen.io/andrewnicolaou/debug/BdMLeb/bYAdyGzzYLDk

# Rotate screenshot
# Because the output from chromium gets messed up when 
# the display rotates it
convert screenshot.png -colorspace gray +matte -depth 2 -rotate -90 screenshot.png

# Draw nice logo
# papirus-draw /app/logo.png -r 90
papirus-draw screenshot.png
