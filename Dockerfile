FROM napnap75/rpi-alpine-base:latest

# Install sickrage
RUN apk update \
	&& apk add git python \
	&& git clone https://github.com/SickRage/SickRage.git /sickrage \
	&& apk del git \
	&& rm -rf /var/cache/apk/*
	
# Define config directory
ENV HOME=/home
VOLUME /home
WORKDIR /home

# Expose HTTP port
EXPOSE 8081

# Define default command
CMD ["/usr/bin/python /sickrage/SickBeard.py --datadir=/home"]
