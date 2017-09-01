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
        gcc

# Install PaPiRus
RUN mkdir /tmp/papirus \
    && git clone https://github.com/PiSupply/PaPiRus.git /tmp/papirus \
    && cd /tmp/papirus \
    && python setup.py install \
    && rm -rf /tmp/papirus

# HACK:
# For some reason, the LM75B temp module doesn't work
# so disable it by default explicitly in the source
RUN sed -i 's/self\._lm75b = LM75B()/self\._lm75b = None/g' /usr/local/lib/python2.7/dist-packages/papirus/epd.py
RUN sed -i 's/self\._uselm75b = True/self\._uselm75b = False/g' /usr/local/lib/python2.7/dist-packages/papirus/epd.py

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


# Install Chromium
# TODO: This could be done with the other apt-get above 
#       for efficiency
RUN apt-get update \
    && apt-get install -y \
        chromium \
        imagemagick

# Clean up packaging cruft
RUN apt-get clean \
    # Remove package lists to free up space
    && rm -rf /var/lib/apt/lists/*


# Systemd please
ENV INITSYSTEM on

CMD ["bash", "/app/run.sh"]
