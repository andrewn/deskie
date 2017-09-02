#!/bin/bash

# Make sure i2c is loaded
modprobe i2c-dev

# Start the fuse driver
systemctl start epd-fuse.service

# Update screen for the first time
/bin/bash /app/update.sh
