# Install

Instructions to make your own Deskie.

## Hardware

You'll need:

1. 1 x Raspberry Pi (tested with a [Raspberry Pi 3 Model B](https://www.raspberrypi.org/products/raspberry-pi-3-model-b/) and [Raspberry Pi 2 Model B](https://www.raspberrypi.org/products/raspberry-pi-2-model-b/))
2. An e-paper display [compatible with the PaPiRus](https://www.pi-supply.com/product/papirus-epaper-eink-screen-hat-for-raspberry-pi/) HAT. I used with the [Percheron Electronics E-paper HAT](http://www.percheron-electronics.uk/shop/e-paper-hat/)
3. SD card (tested with 8GB)
4. Power supply (tested with 2.1A but 2.5A recommended)
5. Wi-Fi adapter if the Pi doesn't have on-board wireless (e.g. the Pi 2)

## Software

This is tested with the open-source "unmanaged" version of [ResinOS](https://resinos.io) that can be deployed locally.

1. Follow [Getting Started](https://resinos.io/docs/raspberrypi3/gettingstarted/) to install ResinOS on a Pi.
2. `git clone https://github.com/andrewn/resin-epaper`
3. `cd resin-epaper`
3. Edit the top of the `Dockerfile` to match the Pi number you want to deploy to
4. `sudo resin local push --source .`
5. Wait for the image to build (this will take a few mins)
6. When the container starts, it should display `logo.png`

## Case

Coming soon.
