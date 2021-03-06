# rpi-sickrage
My own Docker image for Sickrage on a Raspberry Pi

# Status
[![Build Status](https://travis-ci.org/napnap75/rpi-sickrage.svg?branch=master)](https://travis-ci.org/napnap75/rpi-sickrage) [![Image size](https://images.microbadger.com/badges/image/napnap75/rpi-sickrage.svg)](https://microbadger.com/images/napnap75/rpi-sickrage "Get your own image badge on microbadger.com") [![Github link](https://assets-cdn.github.com/favicon.ico)](https://github.com/napnap75/rpi-sickrage) [![Docker hub link](https://www.docker.com/favicon.ico)](https://hub.docker.com/r/napnap75/rpi-sickrage/)

# Content
This image is based [my own Alpine Linux base image](https://hub.docker.com/r/napnap75/rpi-alpine-base/).

This image contains :

- [Sickrage](https://github.com/SickRage/SickRage).

# Usage
1. Map one volume with the `/home` folder if you want the Sickrage config directory (with the config file and database) to persist.
2. Map the volumes where you want you torrent downloaded to an unused folder in the image (for example `/data`).
3. Set the `RUN_AS` environment variable on startup (either with `docker run -e RUN_AS=1234:5678` or with the `environment` key in your compose file). In that case, the image is built with root privileges and only the main process is run as a non-priviledged user (for security reasons). The form of the `RUN_AS` variable must be `UID:GID` of the user.

# Usage example
`docker run -v YOUR-SICKRAGE-HOME-DIRECTORY:/home -v YOUR-MEDIA-FILES-DIRECTORY:/media napnap75/rpi-sickrage:latest`

# Caveats
If you set the `RUN_AS` environment variable, the program will not be allowed to upgrade itself and you will have to manually upgrade it (either by rebuilding the image or by using the `docker exec` command (which do not use the entrypoint script and therefore is run as ROOT)).
