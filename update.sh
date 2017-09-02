echo "Running"

# Take a screenshot
chromium --headless --disable-gpu --screenshot --window-size=169,264 https://the-day-today.glitch.me/

# xargs trims surrounding whitespace
nextFileHash=$(sha1sum screenshot.png | xargs)
lastFileHash=$(cat last-file-hash.txt | xargs)

echo "Comparing hashes"
echo $lastFileHash
echo $nextFileHash

if [ "$nextFileHash" == "$lastFileHash" ]; then
  echo "screenshot is the same, exiting"
  exit 0
fi

echo $nextFileHash > last-file-hash.txt

# Rotate screenshot
# Because the output from chromium gets messed up when 
# the display rotates it
convert screenshot.png -colorspace gray +matte -depth 2 -rotate -90 screenshot.png

# Draw nice logo
# papirus-draw /app/logo.png -r 90
papirus-draw screenshot.png
