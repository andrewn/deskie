# ePaper display × ResinOS

This renders [a calendar web page](https://the-day-today.glitch.me/) screenshot every minute using headless-Chromium. The screenshot is saved at a 2.7 inch epaper display resolution (169,264 px) which is then sent to hte connected epaper display.

Some screenshot file is hashed and the screen will not be updated if the hash matches the last image saved.

## Background 

This is based on the [`resin-io-playground/resinio-PaPiRus`](https://github.com/resin-io-playground/resinio-PaPiRus) Dockerfile here adapted to work on Debian Stretch (Pi2 / 3) or Raspbian Stretch (Pi 1 / Zero).

Although this is intended for the [PaPiRus](https://www.pi-supply.com/product/papirus-epaper-eink-screen-hat-for-raspberry-pi/) HAT, it successfully works with the [Percheron Electronics E-paper HAT](http://www.percheron-electronics.uk/shop/e-paper-hat/).

## Why

The [`PiSupply/PaPiRus`](https://github.com/PiSupply/PaPiRus) is nice as it gives you Python scripts for various demos and functionality. For example, `papirus-draw image.png -r 180` will render an image rotated 180 degrees to the display. `papirus-clear` will clear the display. This is in addition to the Python2.7 API.

## Installation

To make your own Deskie, [follow the instructions in INSTALL.md](INSTALL.md).

## Credits

This is just an amended version of the following:

- [Resin IO example](https://github.com/resin-io-playground/resinio-PaPiRus)
- [.. using `PiSupply/PaPiRus`](https://github.com/PiSupply/PaPiRus)

But I also took inspiration from:

- [@jayniz's embeddedartists-epaper-raspberry-docker](https://github.com/jayniz/embeddedartists-epaper-raspberry-docker)
- [.. based on `embeddedartists/gratis`](https://github.com/embeddedartists/gratis)
- [.. forked from `repaper/gratis`](https://github.com/repaper/gratis/)

## License

Copyright 2017 Andrew Nicolaou.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
