FROM napnap75/rpi-alpine-base:latest

# Install sickrage
RUN apk add py-pip git \
  && pip install --upgrade pip \
  && git clone https://github.com/SickRage/SickRage.git /sickrage

# Required volumes
VOLUME /home

# Define working directory
WORKDIR /home

# Expose HTTP port
EXPOSE 8081

# Define default command
CMD ["/usr/bin/python /sickrage/SickBeard.py --datadir=/home"]
