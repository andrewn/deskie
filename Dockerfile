# Pi 1 or Zero
# FROM resin/raspberry-pi-debian:stretch

# Pi 2
# FROM resin/raspberry-pi2-debian:stretch

# Pi 3
FROM resin/raspberrypi3-debian:stretch

# Templates (don't work)
# FROM resin/%%RESIN_MACHINE_NAME%%-debian:stretch

# Install needed packages
RUN apt-get update \
    && apt-get install -y \
        libfuse-dev \
        fonts-freefont-ttf \
        git \
        python2.7 \
        python-dateutil \
        python-pip \
        python-imaging \
        python-smbus \
        bc \
        i2c-tools \
        make \
        pkg-config \
        gcc \
    # Clean up to save space
    && apt-get clean \
    # Remove package lists to free up space
    && rm -rf /var/lib/apt/lists/*

# Install PaPiRus
RUN mkdir /tmp/papirus \
    && git clone https://github.com/PiSupply/PaPiRus.git /tmp/papirus \
    && cd /tmp/papirus \
    && python setup.py install \
    && rm -rf /tmp/papirus

# Install the driver
RUN mkdir /tmp/gratis \
    && git clone https://github.com/repaper/gratis.git /tmp/gratis \
    && cd /tmp/gratis \
    && make rpi PANEL_VERSION=V231_G2 \
    && make rpi-install PANEL_VERSION=V231_G2 \
    && rm -rf /tmp/gratis

COPY ./epd-fuse/epd-fuse.configuration /etc/default/epd-fuse
COPY ./run.sh /app/run.sh
COPY ./logo.png /app/logo.png

# Systemd please
ENV INITSYSTEM on

CMD ["bash", "/app/run.sh"]
